//
//  ReadingPageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 13/05/24.
//

import Foundation
import SwiftUI

class ReadingPageViewModel: ObservableObject {
    @Published var readingStoryData: [StoryContentReading] = []
    @Published var readingStoryResponse: ResponseDataStoryContent?
    
    func getStoryContents(storyID: Int) {
        guard let url = URL(string: BaseURL.storyContentByID(storyID: storyID)) else {
            print("Invalid URL")
            return
        }
        
        let session = AppURLSession().getBasicURLSession()
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            
            do {
                if let readingStoryResponse = try? JSONDecoder().decode(ResponseDataStoryContent.self, from: data) {
                    if let readingStory = readingStoryResponse.data {
                        DispatchQueue.main.async {
                            self.readingStoryData = readingStory.story?.story_content ?? []
                        }
                    } else {
                        print("No types data available")
                    }
                } else {
                    print("Error decoding JSON")
                }
            }
        }.resume()
    }
}
