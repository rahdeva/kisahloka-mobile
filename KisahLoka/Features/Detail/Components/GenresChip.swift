//
//  GenresChip.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 28/05/24.
//

import SwiftUI

struct GenresChip: View {
    @ObservedObject var detailVM: DetailPageViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 8) {
                ForEach(detailVM.detailStoryData?.genre_name ?? [], id: \.self) { genre in
                    Text(genre)
                        .font(.poppinsCaption2)
                        .foregroundColor(.secondary500)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .fontWeight(.semibold)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.secondary500, lineWidth: 1)
                        )
                }
            }
            .padding(.vertical, 4)
            .padding(.leading, 2)
        }
    }
}
