//
//  HomeView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    StoryView()
                    VStack {
                        ForEach(0..<10, id: \.self) { _ in
                            PostView()
                        }
                    }
                    Spacer()
                }
                
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                CButton(width: 35, height: 35) {
                    
                } label: {
                    Image(systemName: "gear")
                }
            }
        })
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
