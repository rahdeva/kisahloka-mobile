//
//  ContentView.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isSplashPresented: Bool = true
    @StateObject private var authManager = AuthManager()
    
    var body: some View {
        if !isSplashPresented {
            AuthPageView(isUserLoggedIn: authManager.isUserLoggedIn)
        } else{
            SplashScreenView(isPresented: $isSplashPresented)
        }
    }

}

#Preview {
    ContentView()
}
