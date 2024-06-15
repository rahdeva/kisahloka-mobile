//
//  HomePage.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var homeVM = HomePageViewModel()
    @State var navPathOnHome = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPathOnHome){
            ScrollView(showsIndicators: false){
                DiscoverNewLocalStories(
                    homeVM: homeVM,
                    navPath: $navPathOnHome
                )
                
                FavoriteStories(
                    homeVM: homeVM,
                    navPath: $navPathOnHome
                )
                
                StoriesType(
                    homeVM: homeVM,
                    navPath: $navPathOnHome
                )
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("logo-kisahloka")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                }
            }
            .onAppear{
                homeVM.getHome()
            }
            .refreshable {
                homeVM.getHome()
            }
        }
    }
}

#Preview {
    HomePageView()
}
