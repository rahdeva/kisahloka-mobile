//
//  PostReadingPageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 14/05/24.
//

import Foundation
import SwiftUI

class PostReadingPageViewModel: ObservableObject {
    @Published var columns = [
        GridItem(.flexible(), alignment: .top), GridItem(.flexible()),
    ]
    @Published var anotherStoriesData: [RandomRecommendation] = []
    @Published var anotherStoriesResponse: ResponseDataRandomRecommendation?
    
    func formatDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
    
    func getAnotherStories(storyID: Int) {
        guard let url = URL(string: BaseURL.storyRandomRecommendation(storyID: storyID)) else {
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
                if let anotherStoriesResponse = try? JSONDecoder().decode(ResponseDataRandomRecommendation.self, from: data) {
                    if let anotherStories = anotherStoriesResponse.data {
                        DispatchQueue.main.async {
                            self.anotherStoriesData = anotherStories.stories ?? []
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
