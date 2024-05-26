//
//  AuthenticatedScreen.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 26/05/24.
//

import SwiftUI

struct AuthenticatedScreen: View {
    @ObservedObject var authVM: AuthPageViewModel
    @Environment(TabBarModel.self) var showTabBar
    
    var body: some View {
        VStack() {
            switch authVM.selectedTab {
                case .home:
                    HomePageView()
                case .discover:
                    ExplorePageView()
                case .bookmark:
                    BookmarkPageView()
                case .profile:
                    ProfilePageView()
            }
            Spacer()
            if showTabBar.show {
                CustomTabBar(selectedTab: $authVM.selectedTab)
            }
        }
    }
}
