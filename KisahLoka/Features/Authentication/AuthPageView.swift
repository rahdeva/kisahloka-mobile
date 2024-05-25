//
//  AuthPageView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import SwiftUI

struct AuthPageView: View {
    var body: some View {
        ZStack {
            Image("img_bg_auth")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        
            GeometryReader{ p in
                VStack{
                    Text("Perpustakaan Cerita Rakyat Nusantara")
                        .font(.poppinsTitle2)
                        .bold()
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(
                        action: {}
                    ) {
                        Text("Masuk")
                            .frame(width: p.size.width - 72)
                            .padding()
                            .font(.poppinsSubheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .background(Color.primaryColor)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 8)
                    
                    Button(
                        action: {}
                    ) {
                        Text("Daftar")
                            .frame(width: p.size.width - 72)
                            .padding()
                            .font(.poppinsSubheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .background(Color.secondary400)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 16)
                    
                    
                    Text("Lanjutkan sebagai Guest")
                        .font(.poppinsSubheadline)
                        .bold()
                        .foregroundStyle(Color.white)
                        .underline()
                }
            }
            .padding(.top, 56)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    AuthPageView()
}
