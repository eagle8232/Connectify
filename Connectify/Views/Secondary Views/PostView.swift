//
//  PostView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    //MARK: Profile
                    PostProfileView(image: "ConnectifyLogo")
                    
                    Spacer()
                    
                    //MARK: More Button
                    CButton(backgroundColor: .clear) {
                        
                    } label: {
                        Image("moreIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 40)
                    }
                    
                }
                
                
                //MARK: Post Content
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 250)
                        .overlay {
                            Image("examplePostImage1")
                                .resizable()
                                .frame(height: 250)
                                .cornerRadius(15)
                        }
                    ///Comments
                    CommentsView()
                }
                
                //MARK: Social Buttons
                SocialButtons()
                    
                
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color(.label), radius: 1)
                    .padding(-15)
                    
            }
            .padding()
            .padding(.horizontal)
            
        }
    }
}

struct PostProfileView: View {
    var image: String
    
    var body: some View {
        HStack {
            Image(image)
                .circularImage()
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

struct CommentsView: View {
    @State var isShowFullText: Bool = false
    @State var continueOpacity: Double = 0
    var textLength: Int = 100
    var comment: String = "This is a new app, which can bring millions of people together!"
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
                Text(comment)
                .lineLimit(isShowFullText ? comment.count : 6)
                    .font(.headline)
           
            
            if textLength <= comment.count {
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
                        }
                        .cornerRadius(5)
                        .offset(y: 5)
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
        PostView()
    }
}
