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
        .onAppear{
            exploreVM.getExplore()
        }
    }
}

#Preview {
    ExplorePageView()
}
