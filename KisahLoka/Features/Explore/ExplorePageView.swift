//
//  ExplorePageView.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import SwiftUI

struct ExplorePageView: View {
    @StateObject var exploreVM = ExplorePageViewModel()
    @EnvironmentObject var navPathExplore: NavPathExplore
    @State var navPathOnExplore = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPathOnExplore) {
            ScrollView(showsIndicators: false){
                ExploreStoriesGrid(
                    exploreVM: exploreVM,
                    navPath: $navPathOnExplore
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
        .onChange(of: exploreVM.searchKeyword) {
            exploreVM.getExplore()
        }
        .refreshable {
            exploreVM.searchKeyword = ""
            exploreVM.getExplore()
        }
    }
}

//
//#Preview {
//    ExplorePageView()
//}
