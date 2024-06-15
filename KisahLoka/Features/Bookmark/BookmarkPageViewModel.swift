//
//  BookmarkPageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 15/05/24.
//

import Foundation
import SwiftUI

class BookmarkPageViewModel: ObservableObject {
    @Published var columns = [
        GridItem(.flexible(), alignment: .top), GridItem(.flexible()),
    ]
    
    @Published var bookmarkStoriesData: [Bookmark] = []
    @Published var bookmarkResponse: ResponseDataBookmark?
    @Published var isLoading : Bool = false
    @Published var isGuest : Bool = false
    
    func getUserBookmark(user: UserData?) {
        isLoading = true
        guard let url = URL(string: BaseURL.bookmarkByUserID(userID: user?.user_id)) else {
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
                if let bookmarkResponse = try? JSONDecoder().decode(ResponseDataBookmark.self, from: data) {
                    if let bookmark = bookmarkResponse.data {
                        DispatchQueue.main.async {
                            self.bookmarkStoriesData = bookmark.bookmarks ?? []
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
                        print("Bookmark deleted successfully: \(bookmarkResponse)")
                    }
                } else {
                    print("Error decoding JSON response")
                }
            }
        }.resume()
    }
}
