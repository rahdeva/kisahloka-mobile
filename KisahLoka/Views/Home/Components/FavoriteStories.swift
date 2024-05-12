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
            Text("Cerita Favorit")
                .font(.poppinsHeadline)
                .foregroundColor(.slate800)
                .padding(.leading, 24)
                .padding(.bottom, 8)
                .padding(.top, 16)

            if homeVM.favoriteStoriesData.isEmpty{
                ProgressView()
                    .padding(.leading, 24)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(homeVM.favoriteStoriesData, id: \.self) { item in
                            VStack {
                                AsyncImage(url: URL(string: item.thumbnail_image!)){ image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
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
                                        .font(.poppinsCaption1)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.slate800)
                                        .frame(width: 167, alignment: .leading)
                                        .fontWeight(.regular)
                                }
                            }
                            .padding(.leading, 12)
                            .padding(.leading, item == homeVM.favoriteStoriesData.first ? 12 : 0)
                            .padding(.trailing, item == homeVM.favoriteStoriesData.last ? 24 : 0)
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
