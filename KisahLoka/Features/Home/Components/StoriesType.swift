//
//  StoriesType.swift
//  KisahLoka
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct StoriesType: View {
    @ObservedObject var homeVM: HomePageViewModel
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Pilih Jenis Cerita Kesukaan Anda")
                .font(.poppinsHeadline)
                .foregroundColor(.slate800)
                .padding(.top, 8)
                .padding(.leading, 24)
                .padding(.bottom, 8)
            
            LazyVGrid(columns: homeVM.columns, spacing: 12) {
                ForEach(Array(homeVM.typesData.enumerated()), id: \.element.type_id) { index, type in
//                    Rectangle()
//                        .foregroundColor(.primaryColor)
//                        .frame(height: 108, alignment: .bottomTrailing)
//                        .cornerRadius(4)
//                        .overlay{
//                            VStack(alignment: .trailing){
//                                Text("JENIS CERITA")
//                                    .font(.poppinsCaption1)
//                                    .tracking(0.2)
//                                    .foregroundColor(.white)
//                                
//                                Text(type.type_name ?? "Unknown Type")
//                                    .font(.poppinsBody)
//                                    .bold()
//                                    .foregroundColor(.white)
//                            }
//                        }
                    ZStack (alignment: .topLeading){
                        
                        Rectangle()
                            .foregroundColor(.primaryColor)
                            .frame(height: 108, alignment: .topLeading)
                            .cornerRadius(4)
                        
                        ZStack(alignment: .bottomTrailing){
                            Rectangle()
                                .foregroundColor(.primaryColor)
                                .frame(height: 108, alignment: .bottomTrailing)
                                .cornerRadius(4)
                            
                            Image("type-bg")
                                .resizable()
                                .frame(alignment: .bottomTrailing)
                                .opacity(0.75)
                                .frame(width: 110, height: 90)
                                .aspectRatio(contentMode: .fill)
                            
                            Image("type-\(index + 1)")
                                .resizable()
                                .frame(
                                    width: index == 0 || index == 5 || index == 3
                                        ? 126
                                        : (index == 4
                                            ? 104
                                            : 110),
                                    height: 90,
                                    alignment: .bottomTrailing)
                                .aspectRatio(contentMode: .fill)
                        }
                        .aspectRatio(contentMode: .fill)
                        
                        VStack(alignment: .leading){
                            Text("JENIS CERITA")
                                .font(.poppinsCaption1)
                                .tracking(0.2)
                                .foregroundColor(.white)
                            
                            Text(type.type_name ?? "Unknown Type")
                                .font(.poppinsBody)
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 76, alignment: .leading)
                        }
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        
                    }
                    
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.bottom, 24)
    }
}

//
//#Preview {
//    StoriesType()
//}
