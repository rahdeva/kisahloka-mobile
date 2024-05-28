//
//  DetailPageView.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import SwiftUI

struct DetailPageView: View {
    let storyId : Int
    let totalPageStory : Int
    let isBackWithTabBar : Bool
    @StateObject var detailVM = DetailPageViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(TabBarModel.self) var showTabBar
    @Environment(\.modelContext) var context
    @StateObject var authManager = AuthManager()
    
    var body: some View {
        VStack{
            VStack{
                if detailVM.detailStoryData == nil {
                    ProgressView()
                } else{
                    GeometryReader{ p in
                        VStack{
                            ScrollView (showsIndicators: false){
                                AsyncImage(url: URL(string: detailVM.detailStoryData!.thumbnail_image!)){ image in
                                    image
                                        .resizable()
                                        .cornerRadius(12)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: p.size.width - 48, height: p.size.width * 0.5)
//                                .shadow(color: .black, radius: 2)
                                
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
                                
                                AnotherStoriesOnDetail(detailVM: detailVM)
                            }
                            .padding(.top, 16)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 24)
                        }
                    }
                }
                
            }
            
            Spacer()
            VStack {
                Divider()
                    .frame(height: 1)
                    .shadow(radius: 1)
                NavigationLink {
                    ReadingPageView(
                        storyId: storyId,
                        totalPageStory: totalPageStory
                    )
                } label: {
                    Text("Baca Cerita")
                        .fontWeight(.semibold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 100)
                }
                .padding(.top, 16)
                .buttonStyle(.borderedProminent)
                .tint(.primaryColor)
                .cornerRadius(14)
            }
        }
        .onAppear {
            showTabBar.show = false
            detailVM.getStoryDetail(storyID: storyId)
            detailVM.getAnotherStories(storyID: storyId)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(
                action : {
                    if isBackWithTabBar {
                        showTabBar.show = true
                    }
                    self.mode.wrappedValue.dismiss()
                }
            ){
                HStack{
                    Image(systemName: "chevron.backward")
                        .bold()
                        .foregroundStyle(Color.slate500)
                }
            },
            
            trailing: HStack{
                Image(systemName: "bookmark")
                    .bold()
                    .foregroundStyle(Color.slate500)
                    .padding(.trailing, 4)
                
                Image(systemName: "square.and.arrow.up")
                    .bold()
                    .foregroundStyle(Color.slate500)
            }
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Detil Cerita")
                    .font(.poppinsHeadline)
                    .foregroundStyle(Color.primaryColor)
                    .fontWeight(.semibold)
            }
        }
        .onAppear(){
            let user = authManager.getCurrentUser(context: context)
        }
    }
}

//
//#Preview {
//    DetailPageView(storyId: 1)
//}
