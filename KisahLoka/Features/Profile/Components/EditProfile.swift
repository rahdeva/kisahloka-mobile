//
//  EditProfile.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 29/05/24.
//

import SwiftUI
import PopupView

struct EditProfile: View {
    @ObservedObject var profileVM: ProfilePageViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(TabBarModel.self) var showTabBar
    let isBackWithTabBar : Bool
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
            
            List {
                HStack{
                    Text("Nama")
                        .font(.poppinsBody)
                        .foregroundStyle(Color.slate800)
                    Spacer()
                    TextField("Nama", text: $profileVM.nameInput)
                        .foregroundStyle(Color.slate800)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack{
                    Text("Reset Password")
                        .font(.poppinsBody)
                        .foregroundStyle(Color.slate800)
                    Spacer()
                    
                    Button(
                        action: {
                            profileVM.sendResetPassword(email: user?.email)
                            profileVM.isPopUpShow = true
                        }
                    ){
                        Text("Kirim")
                            .font(.poppinsBody)
                            .foregroundStyle(Color.slate800)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 12)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(4)
                    }
                }
                
                DatePicker(
                    selection: $profileVM.birthDateInput,
                    in: profileVM.dateRange,
                    displayedComponents: .date
                ) {
                    Text("Tanggal Lahir")
                }
                
                Text("Jenis Kelamin")
                    .font(.poppinsBody)
                    .foregroundStyle(Color.slate800)
            }
            
            Spacer()
            
            VStack {
                Divider()
                    .frame(height: 1)
                    .shadow(radius: 1)
                Button(
                    action: {
                        
                    }
                ) {
                    Text("Simpan")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.poppinsSubheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color.primaryColor)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 24)
            }
            .background(.white)
        }
        .onAppear {
            showTabBar.show = false
        }
        .background(Color(UIColor.systemGray6))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: Button(
                action : {
                    if isBackWithTabBar {
                        showTabBar.show = true
                    }
                    self.mode.wrappedValue.dismiss()
                }
            ){
                HStack{
                    Image(systemName: "chevron.backward")
                        .bold()
                        .foregroundStyle(Color.slate500)
                }
            }
        )
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Ubah Profil")
                    .font(.poppinsTitle3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primaryColor)
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .popup(isPresented: $profileVM.isPopUpShow) {
            PopUpView(
                title: "Cek Email",
                subtitle: "Kami sudah mengirimkan Link Reset Password Baru ke Email kamu.\nSilakan cek Email kamu ya!",
                isEmail: true,
                onClose: {
                    profileVM.isPopUpShow = false
                }
            )
        } customize: {
            $0
            .closeOnTap(false)
            .backgroundColor(.black.opacity(0.4))
        }
    }
}
