//
//  BookmarkStories.swift
//  KisahLoka
//
//  Created by MacBook Air on 15/05/24.
//

import SwiftUI

struct BookmarkStories: View {
    @ObservedObject var bookmarkVM: BookmarkPageViewModel
    
    var body: some View {
        if(bookmarkVM.bookmarkStoriesData.isEmpty){
            EmptyDataView(
                text: "Kamu belum memiliki cerita favorit nih yuk jelajahi cerita baru!"
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
                                            .frame(width: 96, height: 60)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .padding(.trailing, 8)
                                    
                                    VStack (alignment: .leading) {
                                        Text(bookmark.title ?? "-")
                                            .font(.poppinsFootnote)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.slate800)
                                            .fontWeight(.regular)
                                        Text(bookmark.origin_name ?? "-")
                                            .font(.poppinsCaption2)
                                            .foregroundColor(.secondary500)
                                            .fontWeight(.medium)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .frame(width: 16, height: 18)
                                        .foregroundStyle(Color.secondary500)
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
    }
}

//#Preview {
//    BookmarkStories()
//}
