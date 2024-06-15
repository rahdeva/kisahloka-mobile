//
//  BookmarkStories.swift
//  KisahLoka
//
//  Created by MacBook Air on 15/05/24.
//

import SwiftUI

struct BookmarkStories: View {
    @ObservedObject var bookmarkVM: BookmarkPageViewModel
    let user : UserData?
    
    var body: some View {
        if !bookmarkVM.isLoading {
                if(bookmarkVM.bookmarkStoriesData.isEmpty){
                    EmptyDataView(
                        text: "Kamu belum memiliki cerita favorit nih yuk jelajahi cerita baru!",
                        searchIll: false
                    )
                    .padding(.top, 150)
                } else{
                    GeometryReader{ p in
                        VStack {
                            ForEach(bookmarkVM.bookmarkStoriesData, id: \.self) { bookmark in
                                NavigationLink(
                                    destination: DetailPageView(
                                        storyId: bookmark.story_id!,
                                        totalPageStory: bookmark.total_content!,
                                        isBackWithTabBar: true
                                    )
                                ){
                                    VStack (alignment: .leading){
                                        HStack{
                                            AsyncImage(url: URL(string: bookmark.thumbnail_image!)){
                                                image in
                                                image.resizable()
                                                    
                                            } placeholder: {
                                                ShimmerBox()
                                            }
                                            .frame(width: 96, height: 60)
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .padding(.trailing, 8)
                                            
                                            VStack (alignment: .leading) {
                                                Text(bookmark.title ?? "-")
                                                    .font(.poppinsFootnote)
                                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                                    .foregroundColor(.slate800)
                                                    .fontWeight(.regular)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                Text(bookmark.origin_name ?? "-")
                                                    .font(.poppinsCaption2)
                                                    .foregroundColor(.secondary500)
                                                    .fontWeight(.medium)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(
                                                action: {
                                                    bookmarkVM.deleteBookmark(bookmarkID: bookmark.bookmark_id)
                                                    bookmarkVM.getUserBookmark(user: user)
                                                }
                                            ){
                                                Image(systemName: "bookmark.fill")
                                                    .resizable()
                                                    .frame(width: 16, height: 18)
                                                    .foregroundStyle(Color.secondary500)
                                            }
                                        }
                                        
                                        Rectangle()
                                            .frame(width: p.size.width - 48, height: 0.3)
                                            .tint(Color.slate300)
                                            .padding(.vertical, 8)
                                    }
                                }
                                .frame(width: p.size.width - 48, alignment: .leading)
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 16)
                        .padding(.bottom, 24)
                    }
                }
            } else {
                VStack (alignment: .leading){
                    ForEach(1...10, id: \.self) { bookmark in
                        VStack (alignment: .leading){
                            HStack{
                                ShimmerBox()
                                    .frame(width: 96, height: 60)
                                    .padding(.trailing, 8)
                                
                                VStack (alignment: .leading) {
                                    ShimmerBox()
                                        .frame(width: 150, height: 14)
                                    ShimmerBox()
                                        .frame(width: 80, height: 12)
                                        .fontWeight(.medium)
                                }
                                
                                Spacer()
                                
                                ShimmerBox()
                                    .frame(width: 24, height: 24)
                            }
                            
                            ShimmerBox()
                                .frame(maxWidth: .infinity, maxHeight: 2)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 24)
        }
    }
}

//#Preview {
//    BookmarkStories()
//}
