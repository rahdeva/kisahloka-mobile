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
    @Published var isLoading: Bool = false
    
    func formatDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
    
    func getAnotherStories(storyID: Int) {
        isLoading = true
        guard let url = URL(string: BaseURL.storyRandomRecommendation(storyID: storyID)) else {
            print("Invalid URL")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.isLoading = false
            }
            return
        }
        
        let session = AppURLSession().getBasicURLSession()
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.isLoading = false
                }
                return
            }
            
            guard let data = data else {
                print("No data received")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.isLoading = false
                }
                return
            }
            
            do {
                if let anotherStoriesResponse = try? JSONDecoder().decode(ResponseDataRandomRecommendation.self, from: data) {
                    if let anotherStories = anotherStoriesResponse.data {
                        DispatchQueue.main.async {
                            self.anotherStoriesData = anotherStories.stories ?? []
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                self.isLoading = false
                            }
                        }
                    } else {
                        print("No types data available")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isLoading = false
                        }
                    }
                } else {
                    print("Error decoding JSON")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.isLoading = false
                    }
                }
            }
        }.resume()
    }
}
