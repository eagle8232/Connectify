//
//  ContentView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var selectedTab: Tab = .home
    
    var body: some View {
        
        ZStack {
        NavigationView {
            switch selectedTab {
            case .home:
                HomeView()
            case .jobs:
                JobsView()
            case .community:
                CommunityView()
            case .profile:
                ProfileView()
            }
        }
            
            
            VStack {
                Spacer()
                CTabBar(selectedTab: $selectedTab)
                    .ignoresSafeArea()
                    .frame(height: 80)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
