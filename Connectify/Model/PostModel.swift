//
//  PostModel.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 15.07.23.
//

import SwiftUI

struct PostModel: Identifiable {
    let id = UUID()
    let text: String
    let image: [Image]
    let comments: [CommentModel]
    
    init(text: String, image: [Image], comments: [CommentModel] = []) {
        self.text = text
        self.image = image
        self.comments = comments
    }
}
