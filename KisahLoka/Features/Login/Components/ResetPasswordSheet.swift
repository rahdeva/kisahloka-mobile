//
//  ResetPasswordSheet.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 29/05/24.
//

import SwiftUI

struct ResetPasswordSheet: View {
    @ObservedObject var loginVM: LoginPageViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack{
                Text("Lupa Password")
                    .font(.poppinsHeadline)
                    .foregroundStyle(Color.primaryColor)
                Spacer()
                Button(
                    action: { dismiss() }
                ){
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.slate500)
                }
            }
            .padding(.bottom, 24)
            
            Text("Masukin Email kamu agar kami bisa mengirimkan link reset password")
                .font(.poppinsFootnote)
                .foregroundStyle(Color.slate800)
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            TextField("Email", text: $loginVM.emailResetInput)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .border(Color.slate300, width: 2.5)
                .background(Color.slate50)
                .cornerRadius(8)
                .tint(Color.slate500)
                .font(.poppinsSubheadline)
                .foregroundStyle(Color.slate800)
                .textInputAutocapitalization(.never)
                .padding(.bottom, 40)
            
            Button(
                action: {
                    loginVM.sendResetPassword(email: loginVM.emailResetInput)
                    dismiss()
                    loginVM.isPopUpShow = true
                }
            ) {
                Text("Kirim")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.poppinsSubheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.primaryColor)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal, 24)
        .frame(alignment: .top)
    }
}
