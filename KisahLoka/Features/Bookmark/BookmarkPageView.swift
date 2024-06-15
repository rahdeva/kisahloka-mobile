//
//  BookmarkPage.swift
//  KisahLoka
//
//  Created by MacBook Air on 03/05/24.
//

import SwiftUI

struct BookmarkPageView: View {
    @StateObject var bookmarkVM = BookmarkPageViewModel()
    let isUserLoggedIn : Bool
    let user : UserData?
    
    var body: some View {
        NavigationStack() {
            ScrollView(showsIndicators: false){
                if(bookmarkVM.isGuest){
                    HStack{
                        Text("Kamu masih menggunakan akun **Guest**, Ayo daftarkan akun ini agar cerita yang kamu sudah tandai tersimpan secara online.")
                            .font(.poppinsCaption2)
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        NavigationLink{
                            GuestRegisterPageView(
                                isBackWithTabBar: true,
                                user: user
                            )
                            .onAppear{
                                bookmarkVM.isGuest = false
                            }
                        } label: {
                            Text("Daftar")
                                .font(.poppinsCaption1)
                                .fontWeight(.semibold)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background(Color.secondary800)
                        .foregroundStyle(Color.white)
                        .cornerRadius(4)
                    }
                    .padding(.all, 24)
                    .background(Color.secondary500)
                }
                
                BookmarkStories(
                    bookmarkVM: bookmarkVM,
                    user: user
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
            if user?.email == nil {
                bookmarkVM.isGuest = true
            }
            bookmarkVM.getUserBookmark(user: user)
        }
        .refreshable{
            bookmarkVM.getUserBookmark(user: user)
        }
    }
}
