//
//  PostsView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 16.07.23.
//

import SwiftUI

struct PostsView: View {
    var profileModel: ProfileModel
    
    @Binding var tabBarVisible: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(profileModel.posts ?? []) { post in
                    PostView(profile: profileModel, post: post, isAllComments: .constant(false), tabBarVisible: $tabBarVisible)
                }
            }
        }
    }
}
