//
//  PostReadingPageView.swift
//  KisahLoka
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct PostReadingPageView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let storyId : Int
    @StateObject var postReadingVM = PostReadingPageViewModel()
    
    var body: some View {
        GeometryReader{ p in
            VStack{
                VStack{
                    ZStack (alignment: .bottomLeading) {
                        Image("img_bg_post_reading")
                            .resizable()
                            .frame(width: p.size.width, height: 220)
                        
                        Image("ill_post_reading")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 167, height: 192)
                            .offset(y: 4)
                            .shadow(radius: 0)
                        
                        Text("Hore, kamu sudah menyelesaikan membaca 1 cerita. Yuk jelajahi cerita lainnya!😍")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .font(.poppinsFootnote)
                            .multilineTextAlignment(.leading)
                            .background(Color.sky800)
                            .foregroundColor(.white)
                            .frame(width: 263)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 0,
                                    bottomLeadingRadius: 24,
                                    bottomTrailingRadius: 24,
                                    topTrailingRadius: 24
                                )
                            )
                            .offset(x: 110, y: -45)
                    }
                    
                    AnotherRecommendStoriesPostReading(postReadingVM: postReadingVM)
                }
                
                Spacer()
                
                VStack {
                    Divider()
                        .frame(height: 1)
                        .shadow(radius: 1)
                    NavigationLink {
                        
                    } label: {
                        Text("Jelajahi Cerita Lainnya")
                            .fontWeight(.semibold)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 60)
                    }
                    .padding(.top, 16)
                    .buttonStyle(.borderedProminent)
                    .tint(.primaryColor)
                    .cornerRadius(14)
                }
            }
            .onAppear {
                postReadingVM.getAnotherStories(storyID: storyId)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(
                action : {
                    self.mode.wrappedValue.dismiss()
                }
            ){
                HStack{
                    Image(systemName: "chevron.backward")
                        .bold()
                }
            }
        )
    }
}

//#Preview {
//    PostReadingPageView()
//}
