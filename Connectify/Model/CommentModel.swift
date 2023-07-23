//
//  CommentModel.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 23.07.23.
//

import SwiftUI

struct CommentModel: Identifiable {
    let id = UUID()
    let date: Date
    let profileName: String
    let text: String
    let likes: Int
    
    init(date: Date, profileName: String, text: String, likes: Int) {
        self.date = date
        self.profileName = profileName
        self.text = text
        self.likes = likes
    }
}
