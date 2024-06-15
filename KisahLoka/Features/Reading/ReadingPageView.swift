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
    @Binding var navPath: NavigationPath
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
                                } placeholder: {
                                    ShimmerBox()
                                }
                                .frame(width: p.size.width - 48, height: p.size.width * 0.5)
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
                                    
                                    Text(
                                        readingVM.currentLanguage == .indonesian
                                        ? content.content_indo ?? "-"
                                        : content.content_eng ?? "-"
                                    )
                                        .padding(.top, 40)
                                        .padding(.leading, 24)
                                        .padding(.trailing, 32)
                                        .font(
                                            readingVM.fontSetting == .footnote
                                            ? .poppinsFootnote
                                            : (readingVM.fontSetting == .subHeadline
                                                ? .poppinsSubheadline
                                                : .poppinsBody
                                              )
                                        )
                                        .multilineTextAlignment(.leading)
                                        .foregroundStyle(Color.sky800)
                                }
                            }
                            .tag(index)
                        } else{
                            VStack{
                                AsyncImage(url: URL(string: content.image!)){ image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ShimmerBox()
                                }
                                .frame(width: p.size.width - 48, height: p.size.width * 0.5)
                                .shadow(color: .black, radius: 2)
                                
                                Text(
                                    readingVM.currentLanguage == .indonesian
                                    ? content.content_indo ?? "-"
                                    : content.content_eng ?? "-"
                                )
                                    .padding(.top, 40)
                                    .padding(.horizontal, 24)
                                    .font(
                                        readingVM.fontSetting == .footnote
                                        ? .poppinsFootnote
                                        : (readingVM.fontSetting == .subHeadline
                                            ? .poppinsSubheadline
                                            : .poppinsBody
                                          )
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(Color.slate800)
                            }
                            .tag(index)
                        }
                    }
                    
                }
                .background(
                    readingVM.warmBackground == true
                    ? Color.warmColor.ignoresSafeArea(edges: .bottom)
                    : Color.white.ignoresSafeArea(edges: .bottom)
                )
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
                    .onAppear {
                        if let thumbImage = UIImage(named: "ic_slider_thumb") {
                            let thumbSize = CGSize(width: 20, height: 20)
                            let resizedThumbImage = thumbImage.resized(to: thumbSize)
                            UISlider.appearance().setThumbImage(resizedThumbImage, for: .normal)
                        }
                    }
                    .accentColor(Color.secondary500)
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
                                    storyId: storyId,
                                    navPath: $navPath
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
//        .background(
//            readingVM.warmBackground == true
//            ? Color.warmColor.ignoresSafeArea(edges: .bottom)
//            : Color.white.ignoresSafeArea(edges: .bottom)
//        )
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
                        .foregroundStyle(Color.slate500)
                    
                    Text("Kembali")
                        .foregroundStyle(Color.slate500)
                }
            },
            
            trailing: HStack{
                Button {
                    if(readingVM.fontSetting == .footnote){
                        readingVM.fontSetting = .subHeadline
                    } else if(readingVM.fontSetting == .subHeadline){
                        readingVM.fontSetting = .body
                    } else{
                        readingVM.fontSetting = .footnote
                    }
                } label: {
                    Image(systemName: "textformat.size")
                        .bold()
                        .foregroundStyle(Color.slate500)
                        .padding(.trailing, 4)
                }
                
                Button {
                    readingVM.warmBackground.toggle()
                } label: {
                    readingVM.warmBackground == true
                    ? Image(systemName: "eyeglasses")
                        .bold()
                        .foregroundStyle(Color.secondary500)
                    : Image(systemName: "eyeglasses")
                        .bold()
                        .foregroundStyle(Color.slate500)
                }
            }
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack{
                    Menu {
                        Button {
                            readingVM.toggleLanguage(newLanguage: .indonesian)
                        } label: {
                            Text("Indonesia")
                        }
                        Button {
                            readingVM.toggleLanguage(newLanguage: .english)
                        } label: {
                            Text("English")
                        }
                    } label: {
                        HStack {
                            Image(systemName: "globe")
                                .bold()
                                .foregroundStyle(Color.secondary500)
                            
                            Text(
                                readingVM.currentLanguage == .indonesian
                                ? "Indonesia"
                                : "English"
                            )
                            .font(.poppinsHeadline)
                            .foregroundStyle(Color.secondary500)
                            .fontWeight(.semibold)
                            
                            Image(systemName: "chevron.down")
                                .bold()
                                .foregroundStyle(Color.secondary500)
                        }
                    }
                }
            }
        }
    }
}

//
//#Preview {
//    ReadingPageView()
//}
