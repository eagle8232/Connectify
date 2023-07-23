//
//  SkillsView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 16.07.23.
//

import SwiftUI

struct SkillsView: View {
    var profileModel: ProfileModel
    @State private var showAll = false

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                    ForEach(profileModel.profileSkills?.prefix(showAll ? (profileModel.profileSkills?.count ?? 0) : 6) ?? [], id: \.self) { skill in
                        Text(skill)
                            .padding()
                            .font(.system(size: 15, weight: .medium))
                            .background {
                                Capsule()
                                    .fill(Color(.systemBackground))
                                    .padding(.vertical, 9)
                                    .shadow(color: Color(.label), radius: 1)
                            }
                    }
                }
                .padding(.horizontal, 20)
                
                if (profileModel.profileSkills?.count ?? 0) > 6 && !showAll {
                    Button {
                        showAll.toggle()
                    } label: {
                        Text("See All")
                            .foregroundColor(Color("mainColor"))
                    }
                    .padding()
                }
            }
        }
    }
}
