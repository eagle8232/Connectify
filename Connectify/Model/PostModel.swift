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
    
    init(text: String, image: [Image]) {
        self.text = text
        self.image = image
    }
}
