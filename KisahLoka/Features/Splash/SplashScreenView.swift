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
    @State private var imageLogoOpacity = 0.0
    @State private var opacity = 1.0
    @State private var scale2 = CGSize(width: 0.8, height: 0.8)
    
    var body: some View {
        ZStack{
            Image("img_bg_splash")
                .ignoresSafeArea()
            
            VStack{
                Image("img_logo_splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .opacity(imageOpacity)
                    .scaleEffect(scale)
                    .offset(x: -8)
                
                Image("logo-kisahloka")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 245, height: 64)
                    .opacity(imageLogoOpacity)
                    .scaleEffect(scale2)
            }
        }
        .opacity(opacity)
        .onAppear{
            withAnimation(.easeInOut(duration: 1.5)){
                scale = CGSize(width: 1, height: 1)
                scale2 = CGSize(width: 1, height: 1)
                imageOpacity = 1
                imageLogoOpacity = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                withAnimation(.easeOut(duration: 1.85)){
                    imageLogoOpacity = 0
                }
            })
            
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
