//
//  ReadingPageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 13/05/24.
//

import Foundation
import SwiftUI

enum Language {
    case english
    case indonesian
}

enum FontDiff {
    case footnote
    case subHeadline
    case body
}

class ReadingPageViewModel: ObservableObject {
    @Published var readingStoryData: [StoryContentReading] = []
    @Published var readingStoryResponse: ResponseDataStoryContent?
    @Published var currentLanguage: Language = .indonesian
    @Published var fontSetting: FontDiff = .footnote
    @Published var warmBackground: Bool = false
        
    func toggleLanguage(newLanguage: Language) {
        self.currentLanguage = newLanguage
    }
    
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
