//
//  AllCommentsView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 23.07.23.
//

import SwiftUI

struct AllCommentsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var profileModel: ProfileModel
    var post: PostModel
    
    @Binding var tabBarVisible: Bool
    @State var comment: String = ""
    @State var isLike: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                PostView(profile: profileModel, post: post, isAllComments: .constant(true), tabBarVisible: .constant(false))
                    .padding(.top)
                
                CTextView(text: $comment, textStyle: .constant(.body), placeholder: "Comment...")
                    .frame(height: 100)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(.systemGray4))
                            .padding(-10)
                    }
                    .padding()
                
                
                VStack(alignment: .leading) {
                    ForEach(post.comments) { comment in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(comment.profileName)
                                    .font(.caption.weight(.bold))
                                    .foregroundColor(Color(.label))
                                
                                Text(comment.text)
                                    .font(.caption2.weight(.regular))
                                    .foregroundColor(Color(.label))
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 15, style: .circular)
                                    .fill(Color(.systemGray4))
                                    .padding(-10)
                            }
                            .padding(.top)
                            
                            CButton(backgroundColor: Color(.systemBackground), width: 17, height: 17) {
                                withAnimation {
                                    isLike.toggle()
                                }
                            } label: {
                                Image(isLike ? "tappedLikeIcon" : "likeIcon")
                                    .resizable()
                                    .frame(width: 13, height: 13)
                            }
                            .offset(x: -8, y: 27)

                        }
                    }
                }
                .padding(.horizontal)
                
            }
            .padding(.bottom, 50)
        }
        .navigationTitle("Comments")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                CButton(backgroundColor: .clear, width: 30, height: 30) {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("backIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        })
        .navigationBarBackButtonHidden()
        
    }
}
