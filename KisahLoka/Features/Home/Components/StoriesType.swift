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
                    Rectangle()
                        .foregroundColor(.primaryColor)
                        .frame(height: 108, alignment: .bottomTrailing)
                        .cornerRadius(4)
                        .overlay{
                            VStack(alignment: .trailing){
                                Text("JENIS CERITA")
                                    .font(.poppinsCaption1)
                                    .tracking(0.2)
                                    .foregroundColor(.white)
                                
                                Text(type.type_name ?? "Unknown Type")
                                    .font(.poppinsBody)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    //                            ZStack (alignment: .bottomTrailing){
                    //
                    //                                Rectangle()
                    //                                    .foregroundColor(.primaryColor)
                    //                                    .frame(height: 108, alignment: .bottomTrailing)
                    //                                    .cornerRadius(4)
                    //
                    //                                ZStack(alignment: .bottomTrailing){
                    //                                    Image("type-bg")
                    //                                        .resizable()
                    //                                        .frame(alignment: .bottomTrailing)
                    //                                        .opacity(0.75)
                    //                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    //                                        .aspectRatio(contentMode: .fill)
                    //
                    //                                    Image("type-\(index + 1)")
                    //                                        .resizable()
                    //                                        .frame(alignment: .bottomTrailing)
                    //                                }
                    //                                .aspectRatio(contentMode: .fill)
                    //                                .frame(width: 100, height: 100, alignment: .bottomTrailing)
                    //
                    //                                VStack(alignment: .leading){
                    //                                    Text("JENIS CERITA")
                    //                                        .font(.poppinsCaption1)
                    //                                        .tracking(0.2)
                    //                                        .foregroundColor(.white)
                    //
                    //                                    Text(type.type_name ?? "Unknown Type")
                    //                                        .font(.poppinsBody)
                    //                                        .bold()
                    //                                        .foregroundColor(.white)
                    //                                }
                    //                                .padding(.bottom, 50)
                    //                                .padding(.trailing, 50)
                    //
                    //                            }
                    
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
