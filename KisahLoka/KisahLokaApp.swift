//
//  KisahLokaApp.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            return true
        }
}

@main
struct KisahLokaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var languageSettings = LanguageSetting()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(TabBarModel())
                .environmentObject(NavPathExplore())
                .environment(languageSettings)
                .environment(\.locale, languageSettings.locale)
        }
        .modelContainer(for: UserData.self)
    }
}
