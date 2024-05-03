//
//  CustomTabBar.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack{
            Button {
                
            } label: {
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    Text("Home")
                        .font(.title3)
                        .foregroundColor(.secondary700)
                }
            }
            .tint(Color.primary)
            
            Button {
                
            } label: {
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "safari")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    Text("Discover")
                        .font(.title3)
                }
            }
            .tint(.gray)
            
            Button {
                
            } label: {
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    Text("Bookmark")
                        .font(.title3)
                }
            }
            .tint(.gray)
            
            Button {
                
            } label: {
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    Text("Profile")
                        .font(.title3)
                }
            }
            .tint(.gray)
        }
        .frame(height: 32)
    }
}

#Preview {
    CustomTabBar()
}
