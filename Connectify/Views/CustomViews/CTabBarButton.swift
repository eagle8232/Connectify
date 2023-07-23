//
//  CTabBarButton.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 13.07.23.
//

import SwiftUI

struct CTabBarButton: View {
    @Binding var currentTab: ContentTab
    var tab: ContentTab
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation{currentTab = tab }
        }) {
            
            VStack(spacing: 5){
                Text(tab.rawValue)
                    .font(.title2)
                    .foregroundColor(currentTab == tab ? Color("mainColor") : Color(.label).opacity (0.3))
                // default Frame to avoid resizing.
                    .frame(height: 35)
                ZStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 4 )
                    
                    if currentTab == tab {
                        Rectangle()
                            .fill(Color("mainColor"))
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
        }
    }
}
