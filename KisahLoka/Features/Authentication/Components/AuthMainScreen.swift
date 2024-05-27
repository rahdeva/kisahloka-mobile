//
//  AuthMainScreen.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 26/05/24.
//

import SwiftUI

struct AuthMainScreen: View {
    var body: some View {
        ZStack {
            Image("img_bg_auth")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Perpustakaan Lengkap Cerita Nusantara")
                    .font(.poppinsTitle2)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                
                Spacer()
                
                VStack(spacing: 12) {
                    NavigationLink(destination: LoginPageView()) {
                        Text("Masuk")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .font(.poppinsSubheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color.primaryColor)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 24)
                    
                    NavigationLink(destination: RegisterPageView()) {
                        Text("Daftar")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .font(.poppinsSubheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color.secondary500)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.bottom, 16)
                
                Text("Lanjutkan sebagai Guest")
                    .font(.poppinsSubheadline)
                    .bold()
                    .foregroundColor(.white)
                    .underline()
            }
            .padding(.top, 56)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    AuthMainScreen()
}