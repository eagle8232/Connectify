//
//  ProfileModel.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 16.07.23.
//

import SwiftUI

struct ProfileModel: Identifiable, Equatable {
    static func == (lhs: ProfileModel, rhs: ProfileModel) -> Bool {
        return lhs.profileName == rhs.profileName
    }
    
    let id = UUID()
    let profileName: String
    var profileImage: Image?
    var profileBgImage: Image?
    let profileJob: String?
    let profileLocation: String?
    let profileWorkStatus: String?
    var profileFollowers: [ProfileModel]?
    let profileBio: String?
    let profileSkills: [String]?
    let status: ProfileStatus
    var posts: [PostModel]?
    var experiences: [ExperienceModel]?
    
    init(profileName: String, profileImage: Image? = Image("defaultProfileImage"), profileBgImage: Image? = Image("defaultProfileBgImage"), profileJob: String?, profileLocation: String?, profileWorkStatus: String?, profileFollowers: [ProfileModel]?, profileBio: String?, profileSkills: [String]?, status: ProfileStatus, posts: [PostModel]? = nil, experiences: [ExperienceModel]? = nil) {
        self.profileName = profileName
        self.profileImage = profileImage
        self.profileBgImage = profileBgImage
        self.profileJob = profileJob
        self.profileLocation = profileLocation
        self.profileWorkStatus = profileWorkStatus
        self.profileFollowers = profileFollowers
        self.profileBio = profileBio
        self.profileSkills = profileSkills
        self.status = status
        self.posts = posts
        self.experiences = experiences
    }
}
