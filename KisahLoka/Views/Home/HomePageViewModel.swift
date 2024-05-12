//
//  HomePageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 06/05/24.
//

import Foundation
import SwiftUI

class HomePageViewModel: ObservableObject {
    @Published var gridLayout = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    @Published var columns = [GridItem(.flexible()), GridItem(.flexible()),]
    
    @Published var searchKeyword : String = ""
    @Published var highlightStoriesData: [HighlightStoriesHome] = []
    @Published var favoriteStoriesData: [FavoriteStoriesHome] = []
    @Published var typesData: [StoryTypesHome] = []
    @Published var homeResponse: ResponseDataHome?
    
    func getHome() {
        guard let url = URL(string: BaseURL.home) else {
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
                if let homeResponse = try? JSONDecoder().decode(ResponseDataHome.self, from: data) {
                    if let home = homeResponse.data {
                        DispatchQueue.main.async {
                            self.highlightStoriesData = home.highlight_stories ?? []
                            self.favoriteStoriesData = home.favorite_stories ?? []
                            self.typesData = home.story_types ?? []
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

//{
//    //    @Published var gridLayout = [GridItem(.adaptive(minimum: 100))]
//    @Published var test = "mantap"
//    @Published var listDummyCeritaDaerah: [Story] = [
//        Story(
//            id: 1,
//            titleStory: "Malin Kundang",
//            imageStory: "example-1",
//            descStory: "The story of Malin Kundang is a legend from Indonesia that tells of a young man who disrespected his mother and was cursed by the gods to become a stone.",
//            storyType: "Legend",
//            origin: "West Sumatra",
//            storyContent: [
//                StoryContent(
//                    imageStoryContent: "KOSONGAN",
//                    story_Indonesia: "Ini adalah isi cerita pertama dalam bahasa Indonesia.",
//                    story_English: "This is the first story content in English."
//                ),
//                StoryContent(
//                    imageStoryContent: "KOSONGIN",
//                    story_Indonesia: "Ini adalah isi cerita kedua dalam bahasa Indonesia.",
//                    story_English: "This is the second story content in English."
//                )
//            ],
//            genre: [
//                "Tragedy",
//                "Moral",
//                "Curse"
//            ]
//        ),
//        Story(
//            id: 2,
//            titleStory: "Sangkuriang",
//            imageStory: "example-2",
//            descStory: "Sangkuriang adalah legenda asli dari Jawa Barat yang menceritakan tentang seorang pemuda yang tidak menyadari bahwa ia jatuh cinta dengan ibunya sendiri.",
//            storyType: "Legenda",
//            origin: "Jawa Barat",
//            storyContent: [
//                StoryContent(
//                    imageStoryContent: "KOSONGAN",
//                    story_Indonesia: "Ini adalah bagian awal cerita Sangkuriang dalam bahasa Indonesia.",
//                    story_English: "This is the beginning of the Sangkuriang story in English."
//                ),
//                StoryContent(
//                    imageStoryContent: "KOSONGIN",
//                    story_Indonesia: "Ini adalah bagian akhir cerita Sangkuriang dalam bahasa Indonesia.",
//                    story_English: "This is the ending of the Sangkuriang story in English."
//                )
//            ],
//            genre: [
//                "Tragedy",
//                "Myth",
//                "Romance"
//            ]
//        ),
//        Story(
//            id: 3,
//            titleStory: "Bawang Merah Bawang Putih",
//            imageStory: "example-3",
//            descStory: "Bawang Merah Bawang Putih adalah cerita rakyat dari Indonesia yang mengisahkan tentang persahabatan dua saudara tiri dan akhirnya pengkhianatan yang menyedihkan.",
//            storyType: "Cerita Rakyat",
//            origin: "Jawa Tengah",
//            storyContent: [
//                StoryContent(
//                    imageStoryContent: "KOSONGAN",
//                    story_Indonesia: "Ini adalah bagian awal cerita Bawang Merah Bawang Putih dalam bahasa Indonesia.",
//                    story_English: "This is the beginning of the Bawang Merah Bawang Putih story in English."
//                ),
//                StoryContent(
//                    imageStoryContent: "KOSONGIN",
//                    story_Indonesia: "Ini adalah bagian akhir cerita Bawang Merah Bawang Putih dalam bahasa Indonesia.",
//                    story_English: "This is the ending of the Bawang Merah Bawang Putih story in English."
//                )
//            ],
//            genre: [
//                "Moral",
//                "Folklore",
//                "Family"
//            ]
//        ),
//        Story(
//            id: 4,
//            titleStory: "Keong Emas",
//            imageStory: "example-4",
//            descStory: "Keong Emas adalah cerita rakyat dari Jawa Tengah yang mengisahkan tentang seorang putri yang berubah menjadi keong emas.",
//            storyType: "Cerita Rakyat",
//            origin: "Jawa Tengah",
//            storyContent: [
//                StoryContent(
//                    imageStoryContent: "KOSONGAN",
//                    story_Indonesia: "Ini adalah bagian awal cerita Keong Emas dalam bahasa Indonesia.",
//                    story_English: "This is the beginning of the Keong Emas story in English."
//                ),
//                StoryContent(
//                    imageStoryContent: "KOSONGIN",
//                    story_Indonesia: "Ini adalah bagian akhir cerita Keong Emas dalam bahasa Indonesia.",
//                    story_English: "This is the ending of the Keong Emas story in English."
//                )
//            ],
//            genre: [
//                "Fantasy",
//                "Adventure",
//                "Transformation"
//            ]
//        ),
//        Story(
//            id: 5,
//            titleStory: "Legenda Danau Toba",
//            imageStory: "example-5",
//            descStory: "Legenda Danau Toba adalah cerita legenda dari Sumatera Utara yang menceritakan asal-usul Danau Toba.",
//            storyType: "Legenda",
//            origin: "Sumatera Utara",
//            storyContent: [
//                StoryContent(
//                    imageStoryContent: "KOSONGAN",
//                    story_Indonesia: "Ini adalah bagian awal cerita Legenda Danau Toba dalam bahasa Indonesia.",
//                    story_English: "This is the beginning of the Legend of Lake Toba story in English."
//                ),
//                StoryContent(
//                    imageStoryContent: "KOSONGIN",
//                    story_Indonesia: "Ini adalah bagian akhir cerita Legenda Danau Toba dalam bahasa Indonesia.",
//                    story_English: "This is the ending of the Legend of Lake Toba story in English."
//                )
//            ],
//            genre: [
//                "Mythology",
//                "Folklore",
//                "Nature"
//            ]
//        )
//    ]
//}
//    func getTypes() {
//        print("test")
//        guard let url = URL(string: BaseURL.type) else {
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
//                let decodedData = try JSONDecoder().decode(ResponseDataTypes.self, from: data)
//                if let types = decodedData.data?.types {
//                    DispatchQueue.main.async {
//                        self.typesData = types
//                    }
//                } else {
//                    print("No types data available")
//                }
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }.resume()
//    }
//}
