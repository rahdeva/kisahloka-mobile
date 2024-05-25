//
//  Theme.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import Foundation
import SwiftUI

class Theme {
    static func navigationBarTitleColorPrimary(){
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.titleTextAttributes = [.foregroundColor: Color.red]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: Color.red]
               
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
    }
}
