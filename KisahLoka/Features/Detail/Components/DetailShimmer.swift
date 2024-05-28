//
//  DetailShimmer.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 28/05/24.
//

import SwiftUI

struct DetailShimmer: View {
    var body: some View {
        GeometryReader{ p in
            VStack{
                ShimmerBox()
                    .cornerRadius(12)
                    .frame(width: p.size.width - 48, height: p.size.width * 0.5)
                
                VStack (alignment: .center){
                    ShimmerBox()
                        .frame(width: 80, height: 12)
                    ShimmerBox()
                        .frame(width: 150, height: 14)
                    ShimmerBox()
                        .frame(width: 120, height: 14)
                }
                .frame(width: p.size.width - 64)
                .padding(.top, 16)
                .padding(.bottom, 16)
                
                HStack{
                    Spacer()
                    VStack{
                        ShimmerBox()
                            .frame(width: 35, height: 12)
                        
                        ShimmerBox()
                            .frame(width: 50, height: 10)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    VStack{
                        ShimmerBox()
                            .frame(width: 60, height: 12)
                        
                        ShimmerBox()
                            .frame(width: 40, height: 10)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    VStack{
                        ShimmerBox()
                            .frame(width: 35, height: 12)
                        
                        ShimmerBox()
                            .frame(width: 50, height: 10)
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
                
                VStack (alignment: .leading){
                    ShimmerBox()
                        .frame(width: 100, height: 14)
                    
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    ShimmerBox()
                        .frame(width: p.size.width - 48, height: 12)
                    
                }
                .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    DetailShimmer()
}
