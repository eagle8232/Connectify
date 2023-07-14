//
//  ContentView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Tab = .home
    @State var tabBarVisible: Bool = true
    
    var body: some View {
        
        ZStack {
            NavigationView {
                switch selectedTab {
                case .home:
                    HomeView(tabBarVisible: $tabBarVisible)
                case .jobs:
                    JobsView(tabBarVisible: $tabBarVisible)
                case .community:
                    CommunityView(tabBarVisible: $tabBarVisible)
                case .profile:
                    ProfileView(tabBarVisible: $tabBarVisible)
                }
            }
            
            if tabBarVisible {
                VStack {
                    Spacer()
                    CTabBar(selectedTab: $selectedTab)
                        .ignoresSafeArea()
                        .frame(height: 80)
                    
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
