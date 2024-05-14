//
//  HomePageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 06/05/24.
//

import Foundation
import SwiftUI

class ExplorePageViewModel: ObservableObject {
    @Published var columns = [
        GridItem(.flexible(), alignment: .top), GridItem(.flexible()),
    ]
    
    @Published var searchKeyword : String = ""
    @Published var exploreStoriesData: [ExploreStories] = []
    @Published var exploreResponse: ResponseDataExplore?
    
    func getExplore() {
        guard let url = URL(string: BaseURL.storyExplore) else {
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
                if let exploreResponse = try? JSONDecoder().decode(ResponseDataExplore.self, from: data) {
                    if let explore = exploreResponse.data {
                        DispatchQueue.main.async {
                            self.exploreStoriesData = explore.stories ?? []
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
