//
//  StoryTypePageViewModel.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 29/05/24.
//

import Foundation
import SwiftUI

class StoryTypePageViewModel: ObservableObject {
    @Published var columns = [
        GridItem(.flexible(), alignment: .top), GridItem(.flexible()),
    ]
    
    @Published var searchKeyword : String = ""
    @Published var storyTypeStoriesData: [ExploreStories] = []
    @Published var storyTypeResponse: ResponseDataExplore?
    @Published var isLoading : Bool = false
    
    func getStoryTypeStories(type_id: Int?) {
        isLoading = true
        guard let url = URL(string: BaseURL.storyTypeExplore(
            searchKeyword: searchKeyword,
            type_id: type_id
        )) else {
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
                if let exploreResponse = try? JSONDecoder().decode(ResponseDataExplore.self, from: data) {
                    if let explore = exploreResponse.data {
                        DispatchQueue.main.async {
                            self.storyTypeStoriesData = explore.stories ?? []
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
