//
//  PopUpView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 29/05/24.
//

import SwiftUI

struct PopUpView: View {
    let title: String
    let subtitle: String
    let isEmail: Bool
    var onClose: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.poppinsHeadline)
                .foregroundStyle(Color.primaryColor)
                .padding(.bottom, isEmail ? -40 : 0)
            
            if isEmail {
                LottieView(
                    animationName: "emailLottie2",
                    loopMode: .loop
                )
                .frame(width: 300, height: 300)
            } else {
                LottieView(
                    animationName: "checkLottie",
                    loopMode: .loop
                )
                .frame(width: 200, height: 200)
            }
            
            Text(subtitle)
                .foregroundColor(Color.slate800)
                .font(.poppinsFootnote)
                .multilineTextAlignment(.center)
                .padding(.top, isEmail ? -40 : 0)
                .padding(.bottom, 40)
            
            Button(
                action: {
                    onClose()
                }
            ) {
                Text("Selesai")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.poppinsSubheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.primaryColor)
                    .cornerRadius(8)
            }

        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
        .background(Color.white.cornerRadius(20))
        .padding(.horizontal, 24)
    }
}
