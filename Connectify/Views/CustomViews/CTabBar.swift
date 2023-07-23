//
//  CTabBar.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct CTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.systemBackground))
                .ignoresSafeArea()
                .overlay {
                    HStack(spacing: 46) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            tabButton(tab: tab)
                        }
                        .padding(.bottom, 23)
                    }
                }
                .frame(height: 90)
                .offset(y: 10)
                
        }
    }
    
    private func tabButton(tab: Tab) -> some View {
        VStack {
            Button {
                selectedTab = tab
            } label: {
                VStack {
                    Image(imageName(for: tab))
                        .resizable()
                        .frame(width: 30, height: 30)
                        .tint(selectedTab == tab ? .blue : .gray)
                    Text(tab.rawValue)
                        .font(.caption)
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                }
                
            }
        }
    }
    
    private func imageName(for tab: Tab) -> String {
        switch tab {
        case .home:
            if selectedTab == .home {
                return "tappedHomeIcon"
            }
            return "homeIcon"
        case .community:
            if selectedTab == .community {
                return "tappedCommunityIcon"
            }
            return "communityIcon"
        case .post:
            if selectedTab == .post {
                return "tappedPostIcon"
            }
            return "postIcon"
        case .jobs:
            if selectedTab == .jobs {
                return "tappedJobsIcon"
            }
            return "jobsIcon"
        case .profile:
            if selectedTab == .profile {
                return "tappedProfileIcon"
            }
            return "profileIcon"
        }
    }
}

struct CTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CTabBar(selectedTab: .constant(.home))
    }
}
