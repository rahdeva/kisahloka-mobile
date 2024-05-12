//
//  DetailPageView.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import SwiftUI

struct DetailPageView: View {
    let storyId : Int
    @StateObject var detailVM = DetailPageViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("Detil Cerita")
    }
}

#Preview {
    DetailPageView(storyId: 1)
}
