//
//  HomeView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @EnvironmentObject var postManager: PostManager
    @Binding var tabBarVisible: Bool
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                AddStoryView()
                                
                                ForEach(0..<10, id: \.self) { i in
                                    StoryView()
                                }
                            }
                            .padding()
                        }
                    }
                    
                    Divider()
                    
                    VStack {
                        ForEach(postManager.postModel ?? []) { postModel in
                            PostView(postModel: postModel)
                        }
                    }
                    Spacer()
                }
                
            }
            .padding(.bottom, 100)
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
        HomeView(tabBarVisible: .constant(true))
    }
}
