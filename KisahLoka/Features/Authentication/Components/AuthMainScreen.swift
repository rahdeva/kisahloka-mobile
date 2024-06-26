//
//  AuthMainScreen.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 26/05/24.
//

import SwiftUI

struct AuthMainScreen: View {
    @Environment(\.modelContext) var context
    @StateObject var authVM = AuthPageViewModel()
    
    var body: some View {
        ZStack {
            Image("img_bg_auth")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("img_logo_text_white")
                    .resizable()
                    .frame(width: 290, height: 73)
                    .padding(.vertical, 10)
                
                Text("Perpustakaan Lengkap\nCerita Nusantara")
                    .font(.poppinsSubheadline)
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
                
                Button(
                    action: {
                        authVM.signInAnonymous(context: context)
                    }
                ){
                    HStack{
                        Image(systemName: "person.circle")
                            .foregroundStyle(.white)
                            .font(.poppinsSubheadline)
                            .fontWeight(.semibold)
                        
                        Text("Masuk sebagai Guest")
                            .font(.poppinsSubheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .underline()
                    }
                }
            }
            .padding(.top, 56)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    AuthMainScreen()
}
