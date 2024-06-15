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
    @Environment(LanguageSetting.self) var languageSettings
    
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
                        buttonText:
                            languageSettings.locale == Locale(identifier: "id")
                            ? "Beranda"
                            : "Home",
                        iconActive: "house.fill",
                        iconNonActive: "house",
                        isActive: selectedTab == .home
                    )
                }
                
                Button {
                    selectedTab = .discover
                } label: {
                    TabBarButton(
                        buttonText:
                            languageSettings.locale == Locale(identifier: "id")
                            ? "Jelajahi"
                            : "Explore",
                        iconActive: "safari.fill",
                        iconNonActive: "safari",
                        isActive: selectedTab == .discover
                    )
                }
                
                Button {
                    selectedTab = .bookmark
                } label: {
                    TabBarButton(
                        buttonText: 
                            languageSettings.locale == Locale(identifier: "id")
                            ? "Bookmark"
                            : "Bookmark",
                        iconActive: "books.vertical.fill",
                        iconNonActive: "books.vertical",
                        isActive: selectedTab == .bookmark
                    )
                }
                
                Button {
                    selectedTab = .profile
                } label: {
                    TabBarButton(
                        buttonText: 
                            languageSettings.locale == Locale(identifier: "id")
                            ? "Profil"
                            : "Profile",
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
