//
//  RegisterPageView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import SwiftUI

struct RegisterPageView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var registerVM = RegisterPageViewModel()
    @FocusState private var focus: FormFieldFocusRegister?
    
    var body: some View {
        VStack{
            Text("Buat Akun Baru\nIsi Data dengan Lengkap")
                .font(.poppinsTitle3)
                .bold()
                .foregroundStyle(Color.primaryColor)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
            
            VStack (spacing: 16){
                TextField("Nama", text: $registerVM.nameInput)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .border(Color.slate300, width: 2.5)
                    .background(Color.slate50)
                    .cornerRadius(8)
                    .tint(Color.slate500)
                    .font(.poppinsSubheadline)
                    .foregroundStyle(Color.slate800)
                    .onSubmit {
                        print(registerVM.nameInput)
                        focus = .email
                    }
                    .focused($focus, equals: FormFieldFocusRegister.name)
                
                VStack (spacing: 16){
                    TextField("Email", text: $registerVM.emailInput)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .border(Color.slate300, width: 2.5)
                        .background(Color.slate50)
                        .cornerRadius(8)
                        .tint(Color.slate500)
                        .font(.poppinsSubheadline)
                        .foregroundStyle(Color.slate800)
                        .onSubmit {
                            print(registerVM.emailInput)
                            focus = .dateBirth
                        }
                        .focused($focus, equals: FormFieldFocusRegister.email)
                        .textInputAutocapitalization(.never)
                }
                
                DatePicker(
                    "Tanggal Lahir",
                    selection: $registerVM.birthDate,
                    in: registerVM.dateRange,
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
                .focused($focus, equals: FormFieldFocusRegister.dateBirth)
                .onSubmit {
                    print(registerVM.birthDate)
                    focus = .gender
                }
                
                HStack{
                    Text("Jenis Kelamin")
                    Spacer()
                    Menu {
                        Button {
                            registerVM.genderInput = .male
                        } label: {
                            Text("Laki-laki")
                        }
                        Button {
                            registerVM.genderInput = .female
                        } label: {
                            Text("Perempuan")
                        }
                    } label: {
                        HStack {
                            Text(
                                registerVM.genderInput == Gender.male
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
                .focused($focus, equals: FormFieldFocusRegister.gender)
                
                ZStack(alignment: .trailing){
                    if registerVM.isSecure{
                        SecureField("Kata Sandi", text: $registerVM.passwordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 17)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(registerVM.passwordInput)
                            }
                            .focused($focus, equals: FormFieldFocusRegister.password)
                        
                    }else{
                        TextField("Kata Sandi", text: $registerVM.passwordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(registerVM.passwordInput)
                            }
                            .focused($focus, equals: FormFieldFocusRegister.password)
                    }
                    
                    Button(action: {
                        registerVM.isSecure.toggle()
                    }, label: {
                        Image(systemName: !registerVM.isSecure ? "eye.fill" : "eye.slash.fill" )
                            .foregroundColor(.gray)
                            .padding()
                    })
                    
                }
                .animation(.easeInOut(duration: 0.3), value: registerVM.isSecure)
                
                ZStack(alignment: .trailing){
                    if registerVM.isSecure2{
                        SecureField("Konfirmasi Kata Sandi", text: $registerVM.confirmPasswordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 17)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(registerVM.confirmPasswordInput)
                            }
                            .focused($focus, equals: FormFieldFocusRegister.confirmPassword)
                        
                    }else{
                        TextField("Konfirmasi Kata Sandi", text: $registerVM.confirmPasswordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(registerVM.confirmPasswordInput)
                            }
                            .focused($focus, equals: FormFieldFocusRegister.confirmPassword)
                    }
                    
                    Button(action: {
                        registerVM.isSecure2.toggle()
                    }, label: {
                        Image(systemName: !registerVM.isSecure2 ? "eye.fill" : "eye.slash.fill" )
                            .foregroundColor(.gray)
                            .padding()
                    })
                    
                }
                .animation(.easeInOut(duration: 0.3), value: registerVM.isSecure2)
                
                Button(
                    action: {
                        registerVM.signUpWithEmail()
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
                
                HStack{
                    Text("Sudah mempunyai akun?")
                        .font(.poppinsSubheadline)
                        .foregroundColor(Color.slate800)
                    NavigationLink(destination: LoginPageView()) {
                        Text("Masuk")
                            .font(.poppinsSubheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.secondary500)
                    }
                }
                .padding(.bottom, 40)
            }
            .onAppear{
                focus = FormFieldFocusRegister.name
            }
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(
                    action : {
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
