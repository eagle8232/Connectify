//
//  ContentView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct ContentView: View {
    var profileManager = ProfileManager()
    var postManager = PostManager()
    
    @ObservedObject var userSettings = UserSettings()
    
    @State var selectedTab: Tab = .home
    @State var tabBarVisible: Bool = true
    @State var isAddPost: Bool = false
    
    var body: some View {
        if userSettings.isRegistered {
            
            ZStack {
                NavigationView {
                    VStack {
                        switch selectedTab {
                        case .home:
                            HomeView(tabBarVisible: $tabBarVisible)
                        case .jobs:
                            JobsView(tabBarVisible: $tabBarVisible)
                        case .post:
                            Color.clear
                                .ignoresSafeArea()
                                .navigationTitle("")
                                .onAppear {
                                    isAddPost = true
                                }
                        case .community:
                            CommunityView(tabBarVisible: $tabBarVisible)
                        case .profile:
                            ProfileView(tabBarVisible: $tabBarVisible)
                        }
                    }
                    .environmentObject(profileManager)
                    .environmentObject(postManager)
                }
                .refreshable {
                    
                }
                
                
                
                if tabBarVisible {
                    VStack {
                        Spacer()
                        CTabBar(selectedTab: $selectedTab)
                            .background {
                                Color.black.opacity(0.05) .edgesIgnoringSafeArea(.top)
                                    .offset(y: 9)
                            }
                        
                    }
                    
                }
            }
            .fullScreenCover(isPresented: $isAddPost) {
                AddPostView(isAddPost: $isAddPost) {
                    selectedTab = .home
                }
                .environmentObject(postManager)
                .environmentObject(profileManager)
            }
        } else {
            LoginView(tabBarVisible: $tabBarVisible)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
