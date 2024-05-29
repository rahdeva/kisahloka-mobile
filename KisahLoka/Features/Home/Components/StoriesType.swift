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
            if !homeVM.isLoading{
                Text("Pilih Jenis Cerita Kesukaan Anda")
                    .font(.poppinsHeadline)
                    .foregroundColor(.slate800)
                    .padding(.top, 8)
                    .padding(.leading, 24)
                    .padding(.bottom, 8)
            } else{
                ShimmerBox()
                    .frame(width: 230, height: 18)
                    .padding(.leading, 24)
                    .padding(.bottom, 8)
                    .padding(.top, 16)
            }
            
            if !homeVM.isLoading{
                LazyVGrid(columns: homeVM.columns, spacing: 12) {
                    ForEach(Array(homeVM.typesData.enumerated()), id: \.element.type_id) { index, type in
                        NavigationLink(
                            destination: StoryTypePageView(
                                isBackWithTabBar: true,
                                type_id: type.type_id,
                                type_name: type.type_name
                            )
                        ){
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
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(.top, 10)
                                .padding(.leading, 10)
                                
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            } else{
                LazyVGrid(columns: homeVM.columns, spacing: 12) {
                    ForEach(1...6, id: \.self) { index in
                        ShimmerBox()
                            .frame(height: 108, alignment: .topLeading)
                            .cornerRadius(4)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .padding(.bottom, 24)
    }
}

//
//#Preview {
//    StoriesType()
//}
