//
//  AnotherRecommendStoriesPostReading.swift
//  KisahLoka
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct AnotherRecommendStoriesPostReading: View {
    @ObservedObject var postReadingVM: PostReadingPageViewModel
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Cocok nih untuk kamu baca juga")
                .font(.poppinsHeadline)
                .foregroundColor(.slate800)
                .padding(.top, 12)
                .padding(.horizontal, 16)
            
            if !postReadingVM.isLoading {
                LazyVGrid(columns: postReadingVM.columns, spacing: 12) {
                    ForEach(postReadingVM.anotherStoriesData, id: \.self) { item in
                        NavigationLink(
                            destination: DetailPageView(
                                storyId: item.story_id!,
                                totalPageStory: item.total_content!,
                                isBackWithTabBar: false
                            )
                        ){
                            VStack (alignment: .leading){
                                AsyncImage(url: URL(string: item.thumbnail_image!)){ image in
                                    image.resizable()
                                } placeholder: {
                                    ShimmerBox()
                                }
                                .cornerRadius(4)
                                .frame(width: 167, height: 107)
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                
                                Text(item.origin_name ?? "-")
                                    .font(.poppinsCaption2)
                                    .foregroundColor(.secondary500)
                                    .fontWeight(.medium)
                                Text(item.title ?? "-")
                                    .font(.poppinsCaption1)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.slate800)
                                    .frame(width: 167, alignment: .leading)
                                    .fontWeight(.regular)
                            }
                            .frame(alignment: .top)
                        }
                    }
                }
                .padding(.horizontal, 12)
            } else {
                LazyVGrid(
                    columns: postReadingVM.columns,
                    alignment: .leading,
                    spacing: 12
                ) {
                    ForEach(1...12, id: \.self) { item in
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
                        .frame(alignment: .top)
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
            }

        }
    }
}

//#Preview {
//    AnotherRecommendStoriesPostReading()
//}
