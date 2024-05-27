//
//  NotAuthenticatedProfile.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 26/05/24.
//

import SwiftUI

struct NotAuthenticatedProfile: View {
    @ObservedObject var profileVM: ProfilePageViewModel
    
    var body: some View {
        VStack{
            Image("ill_login")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .padding(.top, 120)
                .padding(.horizontal, 24)
            
            Text("Ayo masuk dulu untuk menyimpan\nseluruh progress dan data\npada aplikasi **KisahLoka**")
                .font(.poppinsCallout)
                .foregroundStyle(Color.slate800)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Spacer()
            
            Button(
                action: {}
            ) {
                Text("Masuk")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.poppinsSubheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.primaryColor)
                    .cornerRadius(8)
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 24)
        }
        .background(Color(UIColor.systemGray6))
    }
}
