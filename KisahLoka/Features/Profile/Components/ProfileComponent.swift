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
            Text(user?.name ?? "-")
            Text(user?.email ?? "-")
            
            List {
                HStack {
                    Text("Username")
                    Spacer()
                    TextField("Username", text: $profileVM.username)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                
                Toggle(isOn: $profileVM.prefersNotifications) {
                    Text("Enable Notifications")
                }
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
