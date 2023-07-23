//
//  ExperiencesView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 22.07.23.
//

import SwiftUI

struct ExperiencesView: View {
    var profileModel: ProfileModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(profileModel.experiences ?? []) { experience in
                    ExperienceView(experience: experience)
                }
            }
        }
    }
}


