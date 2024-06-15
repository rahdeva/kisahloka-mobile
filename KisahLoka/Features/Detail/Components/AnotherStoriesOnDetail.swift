//
//  AnotherStoriesOnDetail.swift
//  KisahLoka
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct AnotherStoriesOnDetail: View {
    @ObservedObject var detailVM: DetailPageViewModel
    @Binding var navPath: NavigationPath
    
    var body: some View {
        VStack (alignment: .leading){
            if !detailVM.isLoading{
                Text("Cerita Lainnya")
                    .font(.poppinsHeadline)
                    .foregroundColor(.slate800)
                    .padding(.top, 8)
            } else{
                ShimmerBox()
                    .frame(width: 200, height: 18)
                    .padding(.leading, 24)
                    .padding(.bottom, 8)
                    .padding(.top, 16)
            }
            
            if !detailVM.isLoading {
                LazyVGrid(columns: detailVM.columns, spacing: 12) {
                    ForEach(detailVM.anotherStoriesData, id: \.self) { item in
                        NavigationLink(
                            destination: DetailPageView(
                                storyId: item.story_id!,
                                totalPageStory: item.total_content!,
                                isBackWithTabBar: false,
                                navPath: $navPath
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
                .padding(.top, 8)
            } else {
                LazyVGrid(
                    columns: detailVM.columns,
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
