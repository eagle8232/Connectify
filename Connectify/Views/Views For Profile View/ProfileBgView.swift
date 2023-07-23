//
//  ProfileBgView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 22.07.23.
//

import SwiftUI

struct ProfileBgView: View {
    var profileBgImage: Image?
    
    var body: some View {
        profileBgImage?
        .resizable()
        .frame(height: 120)
    }
}


