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
    
    func getUserBookmark() {
        guard let url = URL(string: BaseURL.bookmarkByUserID(userID: 2)) else {
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
                if let bookmarkResponse = try? JSONDecoder().decode(ResponseDataBookmark.self, from: data) {
                    if let bookmark = bookmarkResponse.data {
                        DispatchQueue.main.async {
                            self.bookmarkStoriesData = bookmark.bookmarks ?? []
                            print(self.bookmarkStoriesData )
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
