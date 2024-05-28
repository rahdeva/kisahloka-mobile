//
//  FavoriteStories.swift
//  KisahLoka
//
//  Created by MacBook Air on 06/05/24.
//

import SwiftUI

struct FavoriteStories: View {
    @ObservedObject var homeVM: HomePageViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if !homeVM.isLoading{
                Text("Cerita Favorit")
                    .font(.poppinsHeadline)
                    .foregroundColor(.slate800)
                    .padding(.leading, 24)
                    .padding(.bottom, 8)
                    .padding(.top, 16)
            } else{
                ShimmerBox()
                    .frame(width: 150, height: 18)
                    .padding(.leading, 24)
                    .padding(.bottom, 8)
                    .padding(.top, 16)
            }
            
            if !homeVM.isLoading{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(homeVM.favoriteStoriesData, id: \.self) { item in
                            NavigationLink(
                                destination: DetailPageView(
                                    storyId: item.story_id!,
                                    totalPageStory: item.total_content!,
                                    isBackWithTabBar: true
                                )
                            ){
                                VStack {
                                    AsyncImage(url: URL(string: item.thumbnail_image!)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ShimmerBox()
                                    }
                                    .cornerRadius(4)
                                    .frame(width: 167, height: 107)
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    
                                    VStack (alignment: .leading){
                                        Text(item.origin_name ?? "-")
                                            .font(.poppinsCaption2)
                                            .foregroundColor(.secondary500)
                                            .fontWeight(.medium)
                                        Text(item.title ?? "-")
                                            .font(.poppinsFootnote)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.slate800)
                                            .frame(width: 167, alignment: .leading)
                                            .fontWeight(.regular)
                                    }
                                }
                                .padding(.leading, 12)
                                .padding(.leading, item == homeVM.favoriteStoriesData.first ? 12 : 0)
                                .padding(.trailing, item == homeVM.favoriteStoriesData.last ? 24 : 0)}
                        }
                    }
                }
            } else{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(1...4, id: \.self) { item in
                            VStack(alignment: .leading) {
                                ShimmerBox()
                                .cornerRadius(4)
                                .frame(width: 167, height: 107)
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                
                                VStack (alignment: .leading){
                                    ShimmerBox()
                                        .frame(width: 80, height: 12)
                                        .fontWeight(.medium)
                                    ShimmerBox()
                                        .frame(width: 130, height: 14)
                                }
                            }
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
    FavoriteStories(homeVM: HomePageViewModel())
}
