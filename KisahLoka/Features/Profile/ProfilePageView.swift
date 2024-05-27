//
//  ProfilePage.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct ProfilePageView: View {
    @StateObject var profileVM = ProfilePageViewModel()
    let isUserLoggedIn : Bool
    let user : UserData?
    
    var body: some View {
        NavigationStack{
            VStack{
                if isUserLoggedIn {
                    ProfileComponent(
                        profileVM: profileVM,
                        user: user
                    )
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
                } else {
                    NotAuthenticatedProfile(profileVM: profileVM)
                }
            }
        }
    }
}
//
//#Preview {
//    ProfilePageView()
//}
