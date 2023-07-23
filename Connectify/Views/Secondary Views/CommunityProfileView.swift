//
//  CommunityProfileView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 16.07.23.
//

import SwiftUI

struct CommunityProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var profileManager: ProfileManager
    @Binding var tabBarVisible: Bool
    @State var isFollowing: Bool = false
    @State var isShowChat: Bool = false
    
    var profileModel: ProfileModel
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    ZStack {
                        ProfileBgView(profileBgImage: profileModel.profileBgImage)
                        
                        HStack {
                            VStack {
                                profileModel.profileImage?
                                    .circularImage()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color("mainColor"))
                            }
                            
                            Spacer()
                        }
                        .offset(y: 50)
                        .padding()
                    }
                    
                    VStack(alignment: .leading) {
                        //MARK: Personal Info
                        PersonalInfoView(profileModel: profileModel)
                        
                        HStack {
                            CButton() {
                                if let followers = profileManager.myProfile?.profileFollowers, followers.contains(where: {$0 == profileModel}) {
                                    isFollowing = false
                                    profileManager.myProfile?.profileFollowers?.removeAll(where: {$0 == profileModel})
                                } else {
                                    isFollowing = true
                                    profileManager.myProfile?.profileFollowers?.append(profileModel)
                                }
                            } label: {
                                Text(isFollowing ? "Following" : "Follow")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(Color(.systemBackground))
                            }
                            
                            NavigationLink(destination: ChatView(tabBarVisible: $tabBarVisible, reciever: profileModel, sender: profileManager.myProfile!)) {
                                Text("Message")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(Color(.systemBackground))
                                    .background {
                                        RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(.label))
                                        .frame(width: 100, height: 50)
                                        
                                        
                                    }
                            }
                            .padding(.leading)
                            
                            
                        }
                        
                    }
                    .padding(.top, 40)
                    .padding(.horizontal)
                    
                    //MARK: Bio View
                    BioView(profileModel: profileModel)
                        .padding()
                    
                    //MARK: Skills View
                    SkillsView(profileModel: profileModel)
                    
                    //MARK: Profile Contents
                    ProfileContents(profileModel: profileModel, tabBarVisible: $tabBarVisible)
                    
                }
            }
        }
        .onAppear(perform: isFollower)
        .onAppear {
            tabBarVisible = false
        }
        
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                CButton(backgroundColor: .clear, width: 35, height: 35) {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("backIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        })
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
    
    func isFollower() {
        isFollowing = profileManager.myProfile?.profileFollowers?.contains(where: {$0 == profileModel}) ?? false ? true : false
    }
}
