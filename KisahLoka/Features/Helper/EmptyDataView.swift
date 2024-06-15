//
//  EmptyDataView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 23/05/24.
//

import SwiftUI

struct EmptyDataView: View {
    let text: String
    let searchIll: Bool
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            
            if searchIll {
                Image("img_ill_empty_search")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 150)
                    .padding(.bottom, 28)
            } else {
                Image("img_empty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 28)
            }
            
            Text(text)
                .font(.poppinsBody)
                .foregroundStyle(Color.slate500)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
