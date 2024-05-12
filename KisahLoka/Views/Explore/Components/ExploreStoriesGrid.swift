//
//  ExploreStories.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import SwiftUI

struct ExploreStoriesGrid: View {
    @ObservedObject var exploreVM: ExplorePageViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: exploreVM.columns, spacing: 12) {
                ForEach(exploreVM.exploreStoriesData, id: \.self) { item in
                    NavigationLink(
                        destination: DetailPageView(
                            storyId: item.story_id
                        )
                    ){
                        VStack (alignment: .leading){
                            AsyncImage(url: URL(string: item.thumbnail_image!)){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
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
            .padding(.top, 16)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    ExploreStoriesGrid(exploreVM: ExplorePageViewModel())
}
