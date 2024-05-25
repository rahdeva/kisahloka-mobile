//
//  SplashScreenView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var imageOpacity = 0.0
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack{
            Color.primaryColor.ignoresSafeArea()
            
            Image("img_logo_splash")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .opacity(imageOpacity)
                .scaleEffect(scale)
                .offset(x: -8)
        }
        .opacity(opacity)
        .onAppear{
            withAnimation(.easeInOut(duration: 1.5)){
                scale = CGSize(width: 1, height: 1)
                imageOpacity = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                withAnimation(.easeIn(duration: 0.35)){
                    scale = CGSize(width: 50, height: 50)
                    opacity = 0
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9, execute: {
                withAnimation(.easeIn(duration: 0.2)){
                    isPresented.toggle()
                }
            })
        }
    }
}
