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
                if detailVM.detailStoryData == nil || detailVM.isLoading {
                    DetailShimmer()
                        .padding(.top, 16)
                } else{
                    GeometryReader{ p in
                        VStack{
                            ScrollView (showsIndicators: false){
                                StoryDetailInformation(
                                    detailVM: detailVM,
                                    p: p
                                )
                                
                                GenresChip(detailVM: detailVM)
                                    .padding(.horizontal, 24)
                                
                                AnotherStoriesOnDetail(detailVM: detailVM)
                                    .padding(.horizontal, 24)
                            }
                            .padding(.top, 16)
                            .padding(.bottom, 24)
                        }
                    }
                }
                
            }
            
            Spacer()
            if !detailVM.isLoading {
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
    }
}

//
//#Preview {
//    DetailPageView(storyId: 1)
//}
