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
    @Environment(LanguageSetting.self) var languageSettings
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack{
            if user?.gender == "Male"{
                Image("img_avatar_male")
                    .resizable()
                    .frame(width: 152, height: 180)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)
            } else if user?.gender == "Female" {
                Image("img_avatar_female")
                    .resizable()
                    .frame(width: 152, height: 180)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)
            } else {
                Image("img_avatar_guest")
                    .resizable()
                    .frame(width: 152, height: 180)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)
            }
            
            
            Text(user?.name ?? "Guest")
                .font(.poppinsTitle3)
                .foregroundStyle(Color.slate800)
                .padding(.top, 8)
            
            if(user?.email != nil){
                Text(user?.email ?? "-")
                    .font(.poppinsSubheadline)
                    .foregroundStyle(Color.slate500)
            } else {
                VStack{
                    Text("Lengkapi data berikut agar akun **Guest**\nini bisa menjadi akunmu dan\ndata tersimpan secara online")
                        .font(.poppinsCaption1)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink {
                        GuestRegisterPageView(
                            isBackWithTabBar: true,
                            user: user
                        )
                    } label: {
                        HStack{
                            Text("Lengkapi data diri")
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundStyle(Color.slate300)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(Color.secondary500)
                        .foregroundStyle(Color.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 22)
                    .padding(.top, 4)
                }
                .padding(.top, 1)
            }
            
            List {
                if(user?.email != nil){
                    NavigationLink {
                        EditProfile(
                            profileVM: profileVM,
                            isBackWithTabBar: true,
                            user: user
                        )
                    } label: {
                        Text("Ubah Profil")
                    }
                }
                
                HStack{
                    Text("Bahasa")
                    Spacer()
                    Menu {
                        Button {
                            if languageSettings.locale == Locale(identifier: "en"){
                                languageSettings.locale = Locale(identifier: "id")
                            }
                        } label: {
                            Text("Indonesia")
                        }
                        Button {
                            if languageSettings.locale == Locale(identifier: "id"){
                                languageSettings.locale = Locale(identifier: "en")
                            }
                        } label: {
                            Text("English")
                        }
                    } label: {
                        HStack {
                            Text(
                                languageSettings.locale == Locale(identifier: "id")
                                ? "Indonesia"
                                : "English"
                            )
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundStyle(Color.slate800)
                        }
                    }
                }
                
//                languageSettings.locale = Locale(identifier: "zh-Hans")
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
                    profileVM.signOut(context: context)
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
