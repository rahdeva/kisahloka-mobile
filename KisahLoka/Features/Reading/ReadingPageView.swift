//
//  ReadingPageView.swift
//  KisahLoka
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI

struct ReadingPageView: View {
    let storyId : Int
    let totalPageStory : Int
    @State private var sliderValue: Double = 0
    @State private var selectedTab = 0
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var readingVM = ReadingPageViewModel()
    
    var body: some View {
        GeometryReader{ p in
            VStack{
                TabView(selection: $selectedTab) {
                    ForEach(Array(readingVM.readingStoryData.enumerated()), id: \.element.order) { index, content in
                        if(index == totalPageStory - 1){
                            ZStack (alignment: .top){
                                AsyncImage(url: URL(string: content.image!)){ image in
                                    image
                                        .resizable()
                                        .frame(width: p.size.width - 48, height: p.size.width * 0.5)
                                        
                                } placeholder: {
                                    ProgressView()
                                }
                                .blur(radius: 4)
                                
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: p.size.width - 32, height: p.size.width * 0.6)
                                    .opacity(0.8)
                                    .blur(radius: 4)
                                    .offset(y: -4)
                                
                                HStack(alignment: .top){
                                    Image("ill_moral_story")
                                        .offset(x: 24, y: 32)
                                    
                                    Text(content.content_indo ?? "-")
                                        .padding(.top, 40)
                                        .padding(.leading, 24)
                                        .padding(.trailing, 32)
                                        .font(.poppinsFootnote)
                                        .multilineTextAlignment(.leading)
                                        .foregroundStyle(Color.sky500)
                                }
                            }
                            .tag(index)
                        } else{
                            VStack{
                                AsyncImage(url: URL(string: content.image!)){ image in
                                    image
                                        .resizable()
                                        .frame(width: p.size.width - 48, height: p.size.width * 0.5)
                                        .shadow(color: .black, radius: 2)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Text(content.content_indo ?? "-")
                                    .padding(.top, 40)
                                    .padding(.horizontal, 24)
                                    .font(.poppinsFootnote)
                                    .multilineTextAlignment(.center)
                            }
                            .tag(index)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                VStack{
                    Slider(
                        value: Binding(
                            get: { Double(selectedTab) },
                            set: { selectedTab = Int($0) }
                        ),
                        in: 0...Double(totalPageStory - 1),
                        step: 1
                    )
                    .padding()
                    
                    HStack{
                        Button(
                            action: {
                                if(!(selectedTab == 0)){
                                    selectedTab = selectedTab - 1
                                }
                            }
                        ){
                            HStack{
                                Image(systemName: "chevron.left")
                                    .padding(.leading, 24)
                                    .foregroundStyle(
                                        selectedTab == 0 ? Color.slate400 : Color.slate800
                                    )
                                Text("Sebelumnya")
                                    .font(.poppinsCallout)
                                    .foregroundStyle(
                                        selectedTab == 0 ? Color.slate400 : Color.slate800
                                    )
                            }
                        }
                        .disabled(selectedTab == 0)
                        
                        Spacer()
                        
                        Text("\(selectedTab + 1)/\(totalPageStory)")
                            .font(.poppinsHeadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.secondary500)
                        
                        Spacer()
                        
                        if selectedTab == totalPageStory - 1 {
                            NavigationLink(
                                destination: PostReadingPageView(
                                    storyId: storyId
                                )
                            ){
                                HStack{
                                    Text("      Selesai")
                                    .font(.poppinsCallout)
                                    .foregroundStyle(Color.secondary500)
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.trailing, 24)
                                        .foregroundStyle(Color.secondary500)
                                }
                            }
                        } else {
                            Button(
                                action: {
                                    if(!(selectedTab == totalPageStory - 1)){
                                        selectedTab = selectedTab + 1
                                    }
                                }
                            ){
                                HStack{
                                    Text("Selanjutnya")
                                    .font(.poppinsCallout)
                                    .foregroundStyle(Color.slate800)
                                    Image(systemName: "chevron.right")
                                        .padding(.trailing, 24)
                                        .foregroundStyle(Color.slate800)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                readingVM.getStoryContents(storyID: storyId)
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

//
//#Preview {
//    ReadingPageView()
//}