//
//  PostView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct PostView: View {
    var profile: ProfileModel
    var post: PostModel
    
    @Binding var isAllComments: Bool
    @Binding var tabBarVisible: Bool
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    //MARK: Profile
                    PostProfileView(profileModel: profile)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    //MARK: More Button
                    CButton(backgroundColor: .clear) {
                        
                    } label: {
                        Image("moreIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 50)
                    }
                    
                }
                
                
                
                //MARK: Post Content
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 400)
                        .overlay(
                            GeometryReader { proxy in
                                Group {
                                    
                                    if post.image.count == 1 {
                                        post.image[0]
                                            .resizable()
                                            .frame(width: proxy.size.width)
                                            .aspectRatio(contentMode: .fit)
                                        
                                    } else {
                                        TabView {
                                            ForEach(post.image.indices, id: \.self) { index in
                                                post.image[index]
                                                    .resizable()
                                                    .frame(width: proxy.size.width)
                                                    .aspectRatio(contentMode: .fit)
                                            }
                                        }
                                        .tabViewStyle(PageTabViewStyle())
                                    }
                                    
                                }
                            }
                            
                        )
                    
                    
                    
                    ///Comments
                    DescriptionView(postModel: post)
                        .padding(.horizontal)
                }
                
                //MARK: Social Buttons
                SocialButtons(profile: profile, post: post, tabBarVisible: $tabBarVisible)
                    .padding(.horizontal)
                
                if !isAllComments {
                    CommentsView(comments: post.comments)
                        .padding(.horizontal)
                }
                
            }
        }
        .background {
            Rectangle()
                .fill(Color(.systemBackground))
                .shadow(color: Color(.label), radius: 1)
                .padding(-15)
            
        }
        .padding(.bottom)
        
    }
}

struct PostProfileView: View {
    var profileModel: ProfileModel
    
    var body: some View {
        HStack {
            profileModel.profileImage?
                .circularImage()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
            
            VStack(alignment: .leading) {
                Text(profileModel.profileName)
                    .font(.headline)
                Text(profileModel.profileJob ?? "")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            
        }
    }
}

struct DescriptionView: View {
    @State var isShowFullText: Bool = false
    @State var continueOpacity: Double = 0
    var postModel: PostModel
    var textLength: Int = 100
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack {
                Text(postModel.text)
                    .lineLimit(isShowFullText ? postModel.text.count : 6)
                    .font(.system(size: 14, weight: .semibold))
                
                Spacer()
            }
            if textLength <= postModel.text.count {
                Button {
                    withAnimation(.linear(duration: 0.05)) {
                        isShowFullText.toggle()
                    }
                    
                } label: {
                    Text(isShowFullText ? "hide" : "...continue")
                        .foregroundColor(.blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background {
                            Color.white
                                .blur(radius: 5)
                                .opacity(isShowFullText ? 0 : 1)
                        }
                        .cornerRadius(5)
                        .offset(x: 5, y: isShowFullText ? 25 : 10)
                }
                
            }
            
            
        }
    }
}


struct SocialButtons: View {
    var profile: ProfileModel
    var post: PostModel
    
    @Binding var tabBarVisible: Bool
    @State var isGoodIdea: Bool = false
    @State var isLike: Bool = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                //MARK: Like Button
                Button {
                    withAnimation {
                        isLike.toggle()
                    }
                } label: {
                    Image(isLike ? "tappedLikeIcon" : "likeIcon")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                //MARK: Share Button
                Button {
                    withAnimation {
                        isGoodIdea.toggle()
                    }
                } label: {
                    Image(isGoodIdea ? "tappedIdeaIcon" : "ideaIcon" )
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                //MARK: Comment Button
                NavigationLink {
                    AllCommentsView(profileModel: profile, post: post, tabBarVisible: $tabBarVisible)
                        .onAppear {
                            tabBarVisible = false
                        }
                } label: {
                    Image("commentIcon")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Spacer()
            }
        }
        
    }
}

