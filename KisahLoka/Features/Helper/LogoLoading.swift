//
//  LogoLoading.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 28/05/24.
//

import SwiftUI


struct LogoLoading: View {
    @State private var isAnimating = false

    var body: some View {
        VStack (alignment: .center){
            Spacer()
            Image("img_logo_splash")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100) // Sesuaikan ukuran sesuai kebutuhan
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .onAppear {
                    self.isAnimating = true
                }
                .animation(
                    Animation.linear(duration: 0.5)
                        .repeatForever(autoreverses: false),
                    value: isAnimating
                )
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
        .edgesIgnoringSafeArea(.all)
    }
}
