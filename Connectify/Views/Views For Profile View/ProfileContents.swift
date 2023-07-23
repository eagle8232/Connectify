//
//  ProfileContents.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 16.07.23.
//

import SwiftUI

struct ProfileContents: View {
    var profileModel: ProfileModel
    
    @Binding var tabBarVisible: Bool
    @State var currentTab: ContentTab = .posts
    
    @Namespace var animation
     
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 0){
                    CTabBarButton(currentTab: $currentTab, tab: .posts, animation: animation)
                    CTabBarButton(currentTab: $currentTab, tab: .experiences, animation: animation)
                }
                
                switch currentTab {
                case .posts:
                    PostsView(profileModel: profileModel, tabBarVisible: $tabBarVisible)
                case .experiences:
                    ExperiencesView(profileModel: profileModel)
                }
            }
        }
    }
}
