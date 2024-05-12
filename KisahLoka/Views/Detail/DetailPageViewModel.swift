//
//  DetailPageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import Foundation

class ExplorePageViewModel: ObservableObject {
    @Published var columns = [GridItem(.flexible()), GridItem(.flexible()),]
    
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
                if let homeResponse = try? JSONDecoder().decode(ResponseDataExplore.self, from: data) {
                    if let explore = homeResponse.data {
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
