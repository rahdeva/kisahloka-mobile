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
        VStack(spacing: 0) {
            switch selectedTab {
                case .home:
                    HomePage()
                case .discover:
                    DiscoverPage()
                case .bookmark:
                    BookmarkPage()
                case .profile:
                    ProfilePage()
            }
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }
    }

}

#Preview {
    ContentView()
}
