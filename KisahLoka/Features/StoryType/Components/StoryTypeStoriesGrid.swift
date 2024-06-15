//
//  StoryTypeStoriesGrid.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 29/05/24.
//

import SwiftUI

struct StoryTypeStoriesGrid: View {
    @ObservedObject var storyTypeVM: StoryTypePageViewModel
    @Binding var navPath: NavigationPath
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !storyTypeVM.isLoading{
                if storyTypeVM.storyTypeStoriesData.isEmpty{
                    if storyTypeVM.searchKeyword == "" {
                        EmptyDataView(
                            text: "Maaf data masih kosong :)",
                            searchIll: false
                        )
                        .padding(.top, 150)
                    } else {
                        EmptyDataView(
                            text: "Hmm..., hasil pencarian\nkamu tidak ditemukan",
                            searchIll: true
                        )
                        .padding(.top, 150)
                    }
                } else {
                    LazyVGrid(
                        columns: storyTypeVM.columns,
                        alignment: .leading,
                        spacing: 12
                    ) {
                        ForEach(storyTypeVM.storyTypeStoriesData, id: \.self) { item in
                            NavigationLink(
                                destination: DetailPageView(
                                    storyId: item.story_id!,
                                    totalPageStory: item.total_content!,
                                    isBackWithTabBar: true,
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
                                    .aspectRatio(contentMode: .fill)
                                    
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
                                .frame(alignment: .top)
                            }
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                }
            } else{
                LazyVGrid(
                    columns: storyTypeVM.columns,
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
