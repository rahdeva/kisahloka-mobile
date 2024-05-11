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
            Text("Favorite Story")
                .font(.poppinsHeadline)
                .foregroundColor(.slate800)
                .padding(.leading, 16)
                .padding(.bottom, 8)
                .padding(.top, 24)

            if homeVM.favoriteStoriesData.isEmpty{
                ProgressView()
                    .padding(.leading, 16)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(homeVM.favoriteStoriesData, id: \.self) { item in
                            VStack {
                                Image(item.thumbnail_image!)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(12)
                            }
                            .padding(.leading, 16)
                        }
                    }
                }
                .frame(height: 120)
            }
        }
    }
}

#Preview {
    FavoriteStories(homeVM: HomePageViewModel())
}
