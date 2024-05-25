//
//  LoginPageView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import SwiftUI

struct LoginPageView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = LoginPageViewModel()
    @FocusState private var focus: FormFieldFocusLogin?
    
    var body: some View {
        VStack (alignment: .center){
            Image("logo-kisahloka")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 48)
                .offset(y: 8)
            
            Image("img_logo_splash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            
            Text("Selamat Datang!\nSilakan Masuk")
                .font(.poppinsTitle3)
                .bold()
                .foregroundStyle(Color.primaryColor)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
            
            VStack (spacing: 16){
                TextField("Email", text: $loginVM.emailInput)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .border(Color.slate300, width: 2.5)
                    .background(Color.slate50)
                    .cornerRadius(8)
                    .tint(Color.slate500)
                    .font(.poppinsSubheadline)
                    .foregroundStyle(Color.slate800)
                    .onSubmit {
                        print(loginVM.emailInput)
                        focus = .password
                    }
                    .focused($focus, equals: FormFieldFocusLogin.email)
                
//                SecureField("Enter your password", text: $loginVM.passwordInput)
//                    .padding(.horizontal, 24)
//                    .padding(.vertical, 16)
//                    .border(Color.slate300, width: 2.5)
//                    .background(Color.slate50)
//                    .cornerRadius(8)
//                    .tint(Color.slate500)
//                    .font(.poppinsSubheadline)
//                    .foregroundStyle(Color.slate800)
//                    .onSubmit {
//                        print(loginVM.passwordInput)
//                    }
//                    .focused($focus, equals: FormFieldFocusLogin.password)
                
                ZStack(alignment: .trailing){
                    if loginVM.isSecure{
                        SecureField("Kata Sandi", text: $loginVM.passwordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 17)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(loginVM.passwordInput)
                            }
                            .focused($focus, equals: FormFieldFocusLogin.password)
                        
                    }else{
                        TextField("Kata Sandi", text: $loginVM.passwordInput)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .border(Color.slate300, width: 2.5)
                            .background(Color.slate50)
                            .cornerRadius(8)
                            .tint(Color.slate500)
                            .font(.poppinsSubheadline)
                            .foregroundStyle(Color.slate800)
                            .onSubmit {
                                print(loginVM.passwordInput)
                            }
                            .focused($focus, equals: FormFieldFocusLogin.password)
                    }
                    
                    Button(action: {
                        loginVM.isSecure.toggle()
                    }, label: {
                        Image(systemName: !loginVM.isSecure ? "eye.fill" : "eye.slash.fill" )
                            .foregroundColor(.gray)
                            .padding()
                    })
                    
                }
                .animation(.easeInOut(duration: 0.3), value: loginVM.isSecure)
            }
            
            Text("Lupa Password?")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.poppinsFootnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color.slate500)
                .padding(.top, 8)
                .padding(.bottom, 24)
            
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
            
            Spacer()
            
            HStack{
                Text("Belum mempunyai akun?")
                    .font(.poppinsSubheadline)
                    .foregroundColor(Color.slate800)
                NavigationLink(destination: RegisterPageView()) {
                    Text("Daftar Sekarang")
                        .font(.poppinsSubheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.secondary500)
                }
            }
            .padding(.bottom, 40)
        }
        .onAppear{
            focus = FormFieldFocusLogin.email
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

#Preview {
    LoginPageView()
}
