//
//  ProfilePageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 16/05/24.
//

import Foundation

class ProfilePageViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var prefersNotifications: Bool = false
    let authManager : AuthManager = AuthManager.init()
    @Published var detailUserResponse: ResponseDataUserDetail?
    @Published var language: String = ""
    
    func signOut(){
        authManager.signOut { error in
            if let error = error {
                print("Sign-out error: \(error.localizedDescription)")
                // Show error
            }
        }
    }
    
//    func getUserDetail(storyID: Int) {
//        guard let url = URL(string: BaseURL.userByID(userId: )) else {
//            print("Invalid URL")
//            return
//        }
//        
//        let session = AppURLSession().getBasicURLSession()
//        
//        session.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching data: \(error)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            
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
//        }.resume()
//    }
}
