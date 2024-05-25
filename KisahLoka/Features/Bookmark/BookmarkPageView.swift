//
//  BookmarkPage.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct BookmarkPageView: View {
    @StateObject var bookmarkVM = BookmarkPageViewModel()
    
    var body: some View {
        NavigationStack() {
            ScrollView(showsIndicators: false){
                BookmarkStories(
                    bookmarkVM: bookmarkVM
                )
                .padding(.bottom, 24)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Bookmark")
                        .font(.poppinsTitle3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primaryColor)
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
        .onAppear{
            bookmarkVM.getUserBookmark()
        }
    }
}

#Preview {
    BookmarkPageView()
}
