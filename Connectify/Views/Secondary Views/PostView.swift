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
                        .overlay {
                            Image("examplePostImage1")
                                .resizable()
                                .frame(height: 250)
                                
                        }
                    ///Comments
                    DescriptionView()
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

struct DescriptionView: View {
    @State var isShowFullText: Bool = false
    @State var continueOpacity: Double = 0
    var textLength: Int = 100
    var description: String = "This is a new app, which can bring millions of people together!"
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            Text(description)
                .lineLimit(isShowFullText ? description.count : 6)
                .font(.system(size: 14, weight: .light))
            
            if textLength <= description.count {
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
        PostView()
    }
}
