//
//  ContentView.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home


    enum Tab {
        case home
        case discover
        case bookmark
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomePage()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.home)


            DiscoverPage()
                .tabItem {
                    Label("Discover", systemImage: "list.bullet")
                }
                .tag(Tab.discover)
            
            BookmarkPage()
                .tabItem {
                    Label("Bookmark", systemImage: "list.bullet")
                }
                .tag(Tab.bookmark)
            
            ProfilePage()
                .tabItem {
                    Label("Profile", systemImage: "list.bullet")
                }
                .tag(Tab.profile)
        }
    }
}

#Preview {
    ContentView()
}
