//
//  ContentView.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tabs = .home
    @Environment(TabBarModel.self) var showTabBar
    
    var body: some View {
        VStack() {
            switch selectedTab {
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
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }

}

#Preview {
    ContentView()
}
