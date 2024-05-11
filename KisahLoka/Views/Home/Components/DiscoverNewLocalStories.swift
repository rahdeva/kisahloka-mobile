//
//  DiscoverNewLocalStories.swift
//  KisahLoka
//
//  Created by MacBook Air on 06/05/24.
//

import SwiftUI

struct DiscoverNewLocalStories: View { 
    @ObservedObject var homeVM: HomePageViewModel
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Temukan Cerita Daerah Baru")
                .font(.poppinsHeadline)
                .foregroundColor(.slate800)
                .padding(.leading, 16)
                .padding(.bottom, 8)
                .padding(.top, 8)
            
            if homeVM.highlightStoriesData.isEmpty{
                ProgressView()
                    .padding(.leading, 16)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(homeVM.highlightStoriesData, id: \.self){ item in
                            Image(item.thumbnail_image!)
                                .cornerRadius(12)
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
    DiscoverNewLocalStories(homeVM: HomePageViewModel())
}
