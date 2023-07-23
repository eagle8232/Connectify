//
//  AddStoryView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 22.07.23.
//

import SwiftUI

struct AddStoryView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @State var isShowStoryDetail: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    profileManager.myProfile?.profileImage?
                        .circularImage()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .cornerRadius(20)
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 1.7)
                        )
                        .onTapGesture {
                            isShowStoryDetail = true
                        }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .background {
                                Circle()
                                    .fill(Color(.systemBackground))
                                    .shadow(color: Color(.label), radius: 2)
                                    .padding(-5)
                            }
                    }
                    .offset(x: 30, y: -30)
                    
                }
                Text("You")
                    .font(.system(size: 14, weight: .semibold))
            }
        }
        .fullScreenCover(isPresented: $isShowStoryDetail) {
            StoryDetailView(profile: profileManager.myProfile!, isShowStoryDetail: $isShowStoryDetail)
        }
    }
}


