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
    @StateObject var authManager = AuthManager()
    @Environment(\.modelContext) var context
    
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
                    ProfilePageView(
                        isUserLoggedIn: authManager.isUserLoggedIn,
                        user: authManager.getCurrentUser(context: context)
                    )
            }
            Spacer()
            if showTabBar.show {
                CustomTabBar(selectedTab: $authVM.selectedTab)
            }
        }
        .onAppear(){
            authVM.selectedTab = .home
        }
    }
}
