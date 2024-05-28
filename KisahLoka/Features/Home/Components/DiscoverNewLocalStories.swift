//
//  DiscoverNewLocalStories.swift
//  KisahLoka
//
//  Created by MacBook Air on 06/05/24.
//

import SwiftUI
import Shimmer

struct DiscoverNewLocalStories: View { 
    @ObservedObject var homeVM: HomePageViewModel
    
    var body: some View {
        VStack (alignment: .leading){
            if !homeVM.isLoading{
                Text("Temukan Cerita Terbaru")
                    .font(.poppinsHeadline)
                    .foregroundColor(.slate800)
                    .padding(.leading, 24)
                    .padding(.bottom, 8)
                    .padding(.top, 20)
            } else{
                ShimmerBox()
                    .frame(width: 200, height: 18)
                    .padding(.leading, 24)
                    .padding(.bottom, 8)
                    .padding(.top, 16)
            }
            
            if !homeVM.isLoading{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(homeVM.highlightStoriesData, id: \.self){ item in
                            NavigationLink(
                                destination: DetailPageView(
                                    storyId: item.story_id!,
                                    totalPageStory: item.total_content!,
                                    isBackWithTabBar: true
                                )
                            ){
                                AsyncImage(url: URL(string: item.thumbnail_image!)){ image in
                                    image.resizable()
                                    
                                } placeholder: {
                                    ShimmerBox()
                                }
                                .cornerRadius(12)
                                .padding(.leading, 12)
                                .padding(.leading, item == homeVM.highlightStoriesData.first ? 12 : 0)
                                .frame(width: 345, height: 172)
                                .padding(.trailing, item == homeVM.highlightStoriesData.last ? 24 : 0)
                            }
                        }
                    }
                }
            } else{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(1...4, id: \.self) { item in
                            ShimmerBox()
                                .frame(width: 345, height: 172)
                                .cornerRadius(12)
                                .padding(.leading, 12)
                                .padding(.leading, item == 1 ? 12 : 0)
                                .padding(.trailing, item == 4 ? 24 : 0)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DiscoverNewLocalStories(homeVM: HomePageViewModel())
}
