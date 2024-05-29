//
//  DetailPageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import Foundation
import SwiftUI

class DetailPageViewModel: ObservableObject {
    @Published var columns = [
        GridItem(.flexible(), alignment: .top), GridItem(.flexible()),
    ]
    @Published var detailStoryData: DetailStory?
    @Published var detailStoryResponse: ResponseDataDetailStory?
    @Published var anotherStoriesData: [RandomRecommendation] = []
    @Published var anotherStoriesResponse: ResponseDataRandomRecommendation?
    @Published var isLoading : Bool = false
    @Published var isBookmark : Bool = false
    
    func formatDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
    
    func getStoryDetail(storyID: Int, user : UserData?) {
        isLoading = true
        guard let url = URL(string: BaseURL.storyByIDWithUID(
            storyID: storyID,
            uid: user?.uid
        )) else {
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
                if let detailStoryResponse = try? JSONDecoder().decode(ResponseDataDetailStory.self, from: data) {
                    if let detailStory = detailStoryResponse.data {
                        DispatchQueue.main.async {
                            self.detailStoryData = detailStory.story
                            if self.detailStoryData?.is_bookmark == 1 {
                                self.isBookmark = true
                            }
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
    
    func addBookmark(user: UserData?, storyID: Int) {
        guard let url = URL(string: BaseURL.bookmark) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bookmarkRequest = BookmarkRequest(
            user_id: user?.user_id,
            uid: user?.uid,
            story_id: storyID
        )
        
        do {
            let jsonData = try JSONEncoder().encode(bookmarkRequest)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error adding bookmark: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                if let bookmarkResponse = try? JSONDecoder().decode(ResponseAddBookmark.self, from: data) {
                    DispatchQueue.main.async {
                        self.isBookmark = true
                        print("Bookmark added successfully: \(bookmarkResponse)")
                    }
                } else {
                    print("Error decoding JSON response")
                }
            }
        }.resume()
    }
    
    func deleteBookmark(bookmarkID: Int?) {
        guard let url = URL(string: BaseURL.bookmarkByID(bookmarkID: bookmarkID)) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting bookmark: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                if let bookmarkResponse = try? JSONDecoder().decode(ResponseDeleteBookmark.self, from: data) {
                    DispatchQueue.main.async {
                        self.isBookmark = false
                        print("Bookmark deleted successfully: \(bookmarkResponse)")
                    }
                } else {
                    print("Error decoding JSON response")
                }
            }
        }.resume()
    }
}
