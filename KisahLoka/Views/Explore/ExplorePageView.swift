//
//  ExplorePageView.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import SwiftUI

struct ExplorePageView: View {
    @StateObject var exploreVM = ExplorePageViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView {
                ExploreStoriesGrid(exploreVM: exploreVM)
                    .toolbar(.hidden, for: .tabBar)
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .searchable(
                text: $exploreVM.searchKeyword,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .toolbar{
                Text("Jelajahi Cerita")
            }
        }
        .padding(.bottom, 24)
        .onAppear{
            exploreVM.getExplore()
        }
    }
}

#Preview {
    ExplorePageView()
}
