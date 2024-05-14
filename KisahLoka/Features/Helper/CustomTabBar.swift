//
//  CustomTabBar.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

enum Tabs : Int{
    case home = 0
    case discover = 1
    case bookmark = 2
    case profile = 3
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    
    var body: some View {
        VStack {
            Divider()
                .frame(height: 1)
                .shadow(radius: 1)
            HStack(alignment: .center){
                Button {
                    selectedTab = .home
                } label: {
                    TabBarButton(
                        buttonText: "Beranda",
                        iconActive: "house.fill",
                        iconNonActive: "house",
                        isActive: selectedTab == .home
                    )
                }
                
                Button {
                    selectedTab = .discover
                } label: {
                    TabBarButton(
                        buttonText: "Jelajahi",
                        iconActive: "safari.fill",
                        iconNonActive: "safari",
                        isActive: selectedTab == .discover
                    )
                }
                
                Button {
                    selectedTab = .bookmark
                } label: {
                    TabBarButton(
                        buttonText: "Penanda",
                        iconActive: "books.vertical.fill",
                        iconNonActive: "books.vertical",
                        isActive: selectedTab == .bookmark
                    )
                }
                
                Button {
                    selectedTab = .profile
                } label: {
                    TabBarButton(
                        buttonText: "Profil",
                        iconActive: "person.fill",
                        iconNonActive: "person",
                        isActive: selectedTab == .profile
                    )
                }
            }
            .frame(height: 44)
//            .padding(.bottom, 4)
            .padding(.horizontal, 12)
            .background(.white)
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(Tabs.home))
}
