//
//  HomePage.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var homeVM = HomePageViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                DiscoverNewLocalStories(homeVM: homeVM)
                
                FavoriteStories(homeVM: homeVM)
                
                StoriesType(homeVM: homeVM)
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(
                text: $homeVM.searchKeyword,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("logo-kisahloka")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 48)
                        .padding(.vertical, 12)
                }
            }
        }
        .onAppear{
            homeVM.getHome()
        }
        
    }
}

#Preview {
    HomePageView()
}
