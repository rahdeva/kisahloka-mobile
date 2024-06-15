//
//  StoryTypePageView.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 29/05/24.
//

import SwiftUI

struct StoryTypePageView: View {
    @StateObject var storyTypeVM = StoryTypePageViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(TabBarModel.self) var showTabBar
    let isBackWithTabBar : Bool
    let type_id: Int?
    let type_name: String?
    @Binding var navPath: NavigationPath
    
    var body: some View {
        ScrollView(showsIndicators: false){
            StoryTypeStoriesGrid(
                storyTypeVM: storyTypeVM,
                navPath: $navPath
            )
            .padding(.bottom, 24)
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $storyTypeVM.searchKeyword,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onAppear{
            showTabBar.show = false
            storyTypeVM.getStoryTypeStories(type_id: type_id)
        }
        .onChange(of: storyTypeVM.searchKeyword) {
            storyTypeVM.getStoryTypeStories(type_id: type_id)
        }
        .refreshable {
            storyTypeVM.searchKeyword = ""
            storyTypeVM.getStoryTypeStories(type_id: type_id)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(type_name ?? "")
                    .font(.poppinsTitle3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primaryColor)
                    .accessibilityAddTraits(.isHeader)
            }
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
            }
        )
    }
}
