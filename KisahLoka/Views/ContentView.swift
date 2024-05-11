//
//  ContentView.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        VStack() {
            switch selectedTab {
                case .home:
                    HomePageView()
                case .discover:
                    DiscoverPageView()
                case .bookmark:
                    BookmarkPageView()
                case .profile:
                    ProfilePageView()
            }
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }
    }

}

#Preview {
    ContentView()
}
