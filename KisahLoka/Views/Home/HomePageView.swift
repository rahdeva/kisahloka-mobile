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
        NavigationStack{
            ScrollView {
                DiscoverNewLocalStories(homeVM: homeVM)
                
                FavoriteStories(homeVM: homeVM)
                
                ForEach(homeVM.typesData, id: \.type_id) { type in
                    Text(type.type_name ?? "Unknown Type")
                        .foregroundColor(.black)
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .searchable(
                text: $homeVM.searchKeyword,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("logo-kisahloka")
                }
            }
        }
        .onAppear{
            print("Halo")
            homeVM.getHome()
        }
        
    }
}

#Preview {
    HomePageView()
}
