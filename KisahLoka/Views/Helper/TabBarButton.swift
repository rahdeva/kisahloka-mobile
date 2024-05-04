//
//  TabBarButton.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var iconActive: String
    var iconNonActive: String
    var isActive: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .center, spacing: 8) {
                Rectangle()
                    .foregroundColor(isActive ? .primaryColor : .white)
                    .frame(width: geo.size.width/1.25, height: 2)
                    .clipShape(
                     .rect(cornerRadii: RectangleCornerRadii(bottomLeading: 2, bottomTrailing: 2)))
                
                Image(systemName: isActive ? iconActive : iconNonActive)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.bottom, 4)
                    .padding(.top, 4)
                    .foregroundColor(isActive ? .primaryColor : .slate500)
                
                Text(buttonText)
                    .font(.poppinsSubheadline)
                    .foregroundColor(isActive ? .primaryColor : .slate500)
                    .bold(isActive)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .padding(.bottom, 12)
    }
}

#Preview {
    TabBarButton(buttonText: "Home", iconActive: "house.fill", iconNonActive: "house", isActive: true)
}
