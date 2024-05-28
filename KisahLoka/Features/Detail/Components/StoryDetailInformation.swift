//
//  StoryDetailInformation.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 28/05/24.
//

import SwiftUI

struct StoryDetailInformation: View {
    @ObservedObject var detailVM: DetailPageViewModel
    let p : GeometryProxy
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: detailVM.detailStoryData!.thumbnail_image!)){ image in
                image
                    .resizable()
            } placeholder: {
                ShimmerBox()
            }
            .cornerRadius(12)
            .frame(width: p.size.width - 48, height: p.size.width * 0.5)
            
            VStack{
                Text(detailVM.detailStoryData?.origin_name ?? "-")
                    .font(.poppinsCaption1)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary500)
                
                Text(detailVM.detailStoryData?.title ?? "-")
                    .font(.poppinsTitle3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.slate800)
            }
            .frame(width: p.size.width - 64)
            .padding(.top, 16)
            .padding(.bottom, 16)
            
            HStack{
                Spacer()
                VStack{
                    Text(String(detailVM.detailStoryData?.read_count ?? 0))
                        .font(.poppinsHeadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.slate800)
                    
                    Text("Dibaca")
                        .font(.poppinsCaption1)
                        .fontWeight(.medium)
                        .foregroundColor(.slate400)
                }
                
                Spacer()
                Spacer()
                
                VStack{
                    Text(detailVM.formatDateToString(date: detailVM.detailStoryData?.released_date ?? Date.now))
                        .font(.poppinsHeadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.slate800)
                    
                    Text("Tanggal Rilis")
                        .font(.poppinsCaption1)
                        .fontWeight(.medium)
                        .foregroundColor(.slate400)
                }
                
                Spacer()
                Spacer()
                
                VStack{
                    Text(String(detailVM.detailStoryData?.total_content ?? 0))
                        .font(.poppinsHeadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.slate800)
                    
                    Text("Halaman")
                        .font(.poppinsCaption1)
                        .fontWeight(.medium)
                        .foregroundColor(.slate400)
                }
                Spacer()
            }
            .padding(.bottom, 16)
            
            VStack (alignment: .leading){
                Text("Sinopsis")
                    .font(.poppinsSubheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.sky800)
                    .padding(.bottom, 2)
                    .frame(width: p.size.width - 48, alignment: .leading)
                
                LabelAlignment(
                    text: detailVM.detailStoryData?.synopsis ?? "-",
                    textAlignmentStyle: .justified,
                    width: p.size.width - 48,
                    font: UIFont.systemFont(ofSize: 13, weight: .regular)
                )
                .font(.poppinsFootnote)
                .foregroundColor(.slate800)
            }
            .padding(.bottom, 8)
        }
    }
}

//#Preview {
//    StoryDetailInformation()
//}
