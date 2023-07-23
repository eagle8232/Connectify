//
//  ExperienceModel.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 22.07.23.
//

import SwiftUI

struct ExperienceModel: Identifiable {
    let id = UUID()
    let companyName: String
    let role: String
    let startDate: Date
    let endDate: Date?
    let isPresent: Bool
    let skills: [String]
    
    init(companyName: String, role: String, startDate: Date, endDate: Date?, isPresent: Bool, skills: [String]) {
        self.companyName = companyName
        self.role = role
        self.startDate = startDate
        self.endDate = endDate
        self.isPresent = isPresent
        self.skills = skills
    }
}
