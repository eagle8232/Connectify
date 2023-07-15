//
//  ProfileManager.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 15.07.23.
//

import SwiftUI

class ProfileManager: ObservableObject {
    @Published var profileImage: Image = Image("profileImage")
    @Published var profileName: String?
    @Published var profileJob: String?
    @Published var profileLocation: String?
    @Published var profileWorkStatus: String?
    @Published var profileFollowers: String?
    @Published var profileBio: String?
    @Published var profileSkills: [String]?
    
    
}
