//
//  ProfileComponent.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 26/05/24.
//

import SwiftUI

struct ProfileComponent: View {
    @ObservedObject var profileVM: ProfilePageViewModel
    let user : UserData?
    
    var body: some View {
        VStack{
            if user?.gender == "Male"{
                Image("img_avatar_male")
                    .resizable()
                    .frame(width: 152, height: 180)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)
            } else {
                Image("img_avatar_female")
                    .resizable()
                    .frame(width: 152, height: 180)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)
            }
            
            
            Text(user?.name ?? "-")
                .font(.poppinsTitle3)
                .foregroundStyle(Color.slate800)
                .padding(.top, 8)
            
            Text(user?.email ?? "-")
                .font(.poppinsSubheadline)
                .foregroundStyle(Color.slate500)
            
            List {
                NavigationLink {
                    EditProfile(
                        profileVM: profileVM,
                        isBackWithTabBar: true,
                        user: user
                    )
                } label: {
                    Text("Ubah Profil")
                }
                
                NavigationLink {
                    Text("Bahasa")
                } label: {
                    Text("Bahasa")
                }
                
                NavigationLink {
                    Text("Bantuan dan Dukungan")
                } label: {
                    Text("Bantuan dan Dukungan")
                }
                
//                Picker("Seasonal Photo", selection: $profileVM.profile.seasonalPhoto) {
//                    ForEach(Profile.Season.allCases) { season in
//                        Text(season.rawValue).tag(season)
//                    }
//                }
            }
            
            Button(
                action: {
                    profileVM.signOut()
                }
            ) {
                Text("Keluar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.poppinsSubheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.red300)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .background(Color(UIColor.systemGray6))
    }
}
