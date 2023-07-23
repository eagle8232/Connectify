//
//  BioView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 16.07.23.
//

import SwiftUI

struct BioView: View {
    var profileModel: ProfileModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.headline)
                .fontWeight(.bold)
                
//            Text("I am iOS Developer and I am working hard to achieve what Allah has already written to me. Please, always be thankful to Allah!")
            Text(profileModel.profileBio ?? "I am iOS Developer and I am working hard to achieve what Allah has already written to me. Please, always be thankful to Allah!")
                .font(.footnote)
                .fontWeight(.light)
        }
    }
}
