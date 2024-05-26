//
//  ProfilePage.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct ProfilePageView: View {
    @StateObject var profileVM = ProfilePageViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("ill_login")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 120)
                
                Text("Ayo masuk dulu untuk menyimpan\nseluruh progress dan data\npada aplikasi **KisahLoka**")
                    .font(.poppinsCallout)
                    .foregroundStyle(Color.slate800)
                    .multilineTextAlignment(.center)
                
//                List {
//                    HStack {
//                        Text("Username")
//                        Spacer()
//                        TextField("Username", text: $profileVM.username)
//                            .foregroundStyle(.secondary)
//                            .multilineTextAlignment(.trailing)
//                    }
//                    
//                    Toggle(isOn: $profileVM.prefersNotifications) {
//                        Text("Enable Notifications")
//                    }
//                    
//                    Picker("Seasonal Photo", selection: $profileVM.profile.seasonalPhoto) {
//                        ForEach(Profile.Season.allCases) { season in
//                            Text(season.rawValue).tag(season)
//                        }
//                    }
//                }
//                
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
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Profil")
                        .font(.poppinsTitle3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primaryColor)
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
}

#Preview {
    ProfilePageView()
}
