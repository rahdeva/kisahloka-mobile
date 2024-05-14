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
        NavigationStack{
            ScrollView(showsIndicators: false){
                ExploreStoriesGrid(
                    exploreVM: exploreVM
                )
                .padding(.bottom, 24)
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(
                text: $exploreVM.searchKeyword,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Jelajahi Cerita")
                        .font(.poppinsTitle3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primaryColor)
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
        .onAppear{
            exploreVM.getExplore()
        }
    }
}

//
//#Preview {
//    ExplorePageView()
//}
