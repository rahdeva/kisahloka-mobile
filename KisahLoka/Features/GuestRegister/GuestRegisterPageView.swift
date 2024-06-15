//
//  GuestRegisterPageView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 15/06/24.
//

import SwiftUI

struct GuestRegisterPageView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var guestRegisterVM = GuestRegisterPageViewModel()
    @FocusState private var focus: FormFieldFocusGuestRegister?
    @Environment(\.modelContext) var context
    let isBackWithTabBar : Bool
    let user : UserData?
    @Environment(TabBarModel.self) var showTabBar
    @ObservedObject var authVM = AuthPageViewModel()
    
    var body: some View {
        VStack{
            Text("Lengkapi\nData Anda")
                .font(.poppinsTitle3)
                .bold()
                .foregroundStyle(Color.primaryColor)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
            
            VStack (spacing: 16){
                TextField("Nama", text: $guestRegisterVM.nameInput)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .border(Color.slate300, width: 2.5)
                    .background(Color.slate50)
                    .cornerRadius(8)
                    .tint(Color.slate500)
                    .font(.poppinsSubheadline)
                    .foregroundStyle(Color.slate800)
                    .onSubmit {
                        print(guestRegisterVM.nameInput)
                        focus = .email
                    }
                    .focused($focus, equals: FormFieldFocusGuestRegister.name)
                
                VStack (spacing: 16){
                    TextField("Email", text: $guestRegisterVM.emailInput)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .border(Color.slate300, width: 2.5)
                        .background(Color.slate50)
                        .cornerRadius(8)
                        .tint(Color.slate500)
                        .font(.poppinsSubheadline)
                        .foregroundStyle(Color.slate800)
                        .onSubmit {
                            print(guestRegisterVM.emailInput)
                            focus = .dateBirth
                        }
                        .focused($focus, equals: FormFieldFocusGuestRegister.email)
                        .textInputAutocapitalization(.never)
                }
                
                DatePicker(
                    "Tanggal Lahir",
                    selection: $guestRegisterVM.birthDate,
                    in: guestRegisterVM.dateRange,
                    displayedComponents: .date
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .border(Color.slate300, width: 2.5)
                .background(Color.slate50)
                .cornerRadius(8)
                .tint(Color.slate500)
                .font(.poppinsSubheadline)
                .foregroundStyle(Color.slate800)
                .focused($focus, equals: FormFieldFocusGuestRegister.dateBirth)
                .onSubmit {
                    print(guestRegisterVM.birthDate)
                    focus = .gender
                }
                
                HStack{
                    Text("Jenis Kelamin")
                    Spacer()
                    Menu {
                        Button {
                            guestRegisterVM.genderInput = .male
                        } label: {
                            Text("Laki-laki")
                        }
                        Button {
                            guestRegisterVM.genderInput = .female
                        } label: {
                            Text("Perempuan")
                        }
                    } label: {
                        HStack {
                            Text(
                                guestRegisterVM.genderInput == Gender.male
                                ? "Laki-laki"
                                : "Perempuan"
                            )
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundStyle(Color.slate800)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .border(Color.slate300, width: 2.5)
                .background(Color.slate50)
                .cornerRadius(8)
                .tint(Color.slate500)
                .font(.poppinsSubheadline)
                .foregroundStyle(Color.slate800)
                .focused($focus, equals: FormFieldFocusGuestRegister.gender)
                
                ZStack(alignment: .trailing){
                    if guestRegisterVM.isSecure{
                        SecureField("Kata Sandi", text: $guestRegisterVM.passwordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 17)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(guestRegisterVM.passwordInput)
                            }
                            .focused($focus, equals: FormFieldFocusGuestRegister.password)
                        
                    }else{
                        TextField("Kata Sandi", text: $guestRegisterVM.passwordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(guestRegisterVM.passwordInput)
                            }
                            .focused($focus, equals: FormFieldFocusGuestRegister.password)
                    }
                    
                    Button(action: {
                        guestRegisterVM.isSecure.toggle()
                    }, label: {
                        Image(systemName: !guestRegisterVM.isSecure ? "eye.fill" : "eye.slash.fill" )
                            .foregroundColor(.gray)
                            .padding()
                    })
                    
                }
                .animation(.easeInOut(duration: 0.3), value: guestRegisterVM.isSecure)
                
                ZStack(alignment: .trailing){
                    if guestRegisterVM.isSecure2{
                        SecureField("Konfirmasi Kata Sandi", text: $guestRegisterVM.confirmPasswordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 17)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(guestRegisterVM.confirmPasswordInput)
                            }
                            .focused($focus, equals: FormFieldFocusGuestRegister.confirmPassword)
                        
                    }else{
                        TextField("Konfirmasi Kata Sandi", text: $guestRegisterVM.confirmPasswordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(guestRegisterVM.confirmPasswordInput)
                            }
                            .focused($focus, equals: FormFieldFocusGuestRegister.confirmPassword)
                    }
                    
                    Button(action: {
                        guestRegisterVM.isSecure2.toggle()
                    }, label: {
                        Image(systemName: !guestRegisterVM.isSecure2 ? "eye.fill" : "eye.slash.fill" )
                            .foregroundColor(.gray)
                            .padding()
                    })
                    
                }
                .animation(.easeInOut(duration: 0.3), value: guestRegisterVM.isSecure2)
                
                Button(
                    action: {
                        guestRegisterVM.linkAnonymousWithEmail(
                            userData: user,
                            context: context
                        )
                        if isBackWithTabBar {
                            showTabBar.show = true
                        }
                        self.mode.wrappedValue.dismiss()
                        authVM.selectedTab = .home
                    }
                ) {
                    Text("Daftar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.poppinsSubheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color.primaryColor)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .onAppear{
                showTabBar.show = false
                focus = FormFieldFocusGuestRegister.name
            }
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden(true)
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
                            .padding(.leading, 12)
                    }
                }
            )
        }
    }
}
