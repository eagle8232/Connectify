//
//  ProfileManager.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 15.07.23.
//

import SwiftUI

class ProfileManager: ObservableObject {
    let experiences: [ExperienceModel] = [
        .init(companyName: "ABB Bank", role: "iOS Developer", startDate: Date(), endDate: nil, isPresent: true, skills: ["Integrated existing third-party APIs to shorten development times.", "Researched and selected APIs for integration into development projects.", "Founded code review meetings to detect weaknesses in contributed program content, avoiding bug detection by users.", "Maintained existing mobile applications by designing patches to be applied via iOS automatic updates."])
    ]
    @Published var myProfile: ProfileModel?
    
    
    init() {
        myProfile = ProfileModel(profileName: "Vusal Nuriyev", profileImage: Image("profileImage"), profileBgImage: Image("profileBgImage"), profileJob: "iOS Developer", profileLocation: "Baku", profileWorkStatus: "Open to work", profileFollowers: [], profileBio: nil, profileSkills: ["Swift", "Python", "Java", "JavaScript", "C++", "Ruby", "Go", "Rust"], status: ProfileStatus.online, posts: [], experiences: experiences)
    }
    
}
