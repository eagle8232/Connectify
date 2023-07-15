//
//  PostView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject var profileManager: ProfileManager
    var postModel: PostModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    //MARK: Profile
                    PostProfileView()
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
                        .frame(height: 250)
                        .overlay(
                            Group {
                                if postModel.image.count == 1 {
                                    postModel.image[0]
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 250)
                                } else {
                                    TabView {
                                        ForEach(postModel.image.indices, id: \.self) { index in
                                             postModel.image[index]
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(height: 250)
                                        }
                                    }
                                    .tabViewStyle(PageTabViewStyle())
                                }
                            }
                        )

                    ///Comments
                    DescriptionView(postModel: postModel)
                        .padding(.horizontal)
                }
                
                //MARK: Social Buttons
                SocialButtons()
                    .padding(.horizontal)
                
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
}

struct PostProfileView: View {
    @EnvironmentObject var profileManager: ProfileManager
    
    
    var body: some View {
        HStack {
            profileManager.profileImage
                .circularImage()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading) {
                Text("Vusal Nuriyev")
                    .font(.headline)
                Text("Manager")
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
                    .font(.system(size: 14, weight: .light))
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
                Button {
                    
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postModel: PostModel(text: "", image: []))
    }
}
