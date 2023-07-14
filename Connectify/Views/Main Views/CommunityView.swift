//
//  CommunityView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct CommunityView: View {
    @Binding var tabBarVisible: Bool
    var body: some View {
        VStack {
            Text("Welcome to the Community")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            Text("Join our vibrant community to connect with like-minded people, share knowledge, and collaborate on exciting projects.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            CButton(action: {
                
            }) {
                Text("Join Now")
                    .font(.headline)
            }
            .padding()

            Spacer()
        }
    }
}


struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(tabBarVisible: .constant(true))
    }
}
