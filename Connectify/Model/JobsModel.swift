//
//  JobsModel.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 14.07.23.
//

import SwiftUI

struct Job: Identifiable {
    let id = UUID()
    let title: String
    let company: String
    let description: String
    let requirements: String
    let keywords: [String]
    let photoName: String
    
    init(title: String, company: String, description: String, requirements: String, keywords: [String], photoName: String) {
        self.title = title
        self.company = company
        self.description = description
        self.keywords = keywords
        self.photoName = photoName
        self.requirements = requirements
    }
}
