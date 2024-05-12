//
//  DetailPageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import Foundation
import SwiftUI

class DetailPageViewModel: ObservableObject {
//    @Published var columns = [GridItem(.flexible()), GridItem(.flexible()),]
    
//    @Published var detailStoryData: ExploreStories
    @Published var detailStoryResponse: ResponseDataDetailStory?
    
    func getStoryDetail() {
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
            
//            do {
//                if let detailStoryResponse = try? JSONDecoder().decode(ResponseDataDetailStory.self, from: data) {
//                    if let detailStory = detailStoryResponse.data {
//                        DispatchQueue.main.async {
//                            self.detailStoryData = detailStory.story
//                        }
//                    } else {
//                        print("No types data available")
//                    }
//                } else {
//                    print("Error decoding JSON")
//                }
//            }
        }.resume()
    }
}
