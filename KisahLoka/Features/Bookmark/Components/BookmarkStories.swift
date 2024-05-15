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
        GeometryReader{ p in
            VStack{
                ForEach(bookmarkVM.bookmarkStoriesData, id: \.self) { bookmark in
                    NavigationLink(
                        destination: DetailPageView(
                            storyId: bookmark.story_id!,
                            totalPageStory: bookmark.total_content!,
                            isBackWithTabBar: true
                        )
                    ){
                        AsyncImage(url: URL(string: bookmark.thumbnail_image!)){
                            image in
                            image.resizable()
                                .frame(width: 60, height: 60)
                        } placeholder: {
                            ProgressView()
                        }
                        .cornerRadius(4)
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        
                        VStack {
                            Text(bookmark.origin_name ?? "-")
                                .font(.poppinsCaption2)
                                .foregroundColor(.secondary500)
                                .fontWeight(.medium)
                            Text(bookmark.title ?? "-")
                                .font(.poppinsFootnote)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.slate800)
                                .fontWeight(.regular)
                        }
                        
                        Spacer()
                    }
                    .frame(width: p.size.width)
                }
            }
        }
    }
}

//#Preview {
//    BookmarkStories()
//}
