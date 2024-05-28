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
    
    func getUserBookmark() {
        isLoading = true
        guard let url = URL(string: BaseURL.bookmarkByUserID(userID: 2)) else {
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
}
