//
//  HomeView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var profileManager: ProfileManager
    
    @Binding var tabBarVisible: Bool
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
//                    HStack {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack {
//                                AddStoryView()
//
//                                ForEach(profileManager.myProfile?.profileFollowers ?? []) { follower in
//                                    StoryView(profile: follower)
//                                }
//                            }
//                            .padding()
//                        }
//                    }
                    
                    Divider()
                    
                    VStack {
                        ForEach(profileManager.myProfile?.profileFollowers ?? []) { profile in
                            if !(profile.posts?.isEmpty ?? false) {
                                PostsView(profileModel: profile, tabBarVisible: $tabBarVisible)
                            }
                        }
                        PostsView(profileModel: profileManager.myProfile!, tabBarVisible: $tabBarVisible)
                    }
                    Spacer()
                        .padding(.bottom, 100)
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
        HomeView(tabBarVisible: .constant(true))
    }
}
