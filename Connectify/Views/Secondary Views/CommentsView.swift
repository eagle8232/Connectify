//
//  CommentsView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 23.07.23.
//

import SwiftUI

struct CommentsView: View {
    var comments: [CommentModel]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(comments) { comment in
                    HStack {
                        Text(comment.profileName)
                            .font(.caption)
                            .foregroundColor(Color(.label))
                        Text(comment.text)
                            .font(.footnote)
                            .foregroundColor(Color(.systemGray))
                    }
                    .padding(.top, 1)
                }
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(comments: [])
    }
}
