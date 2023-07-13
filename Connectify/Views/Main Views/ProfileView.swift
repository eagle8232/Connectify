//
//  ProfileView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    ZStack {
                        Image("profileBgImage")
                            .resizable()
                            .frame(height: 120)
                        HStack {
                            Image("profileImage")
                                .circularImage()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                            
                            Spacer()
                        }
                        .offset(y: 50)
                        .padding()
                    }
                    
                    ProfileInfoView()
                        .padding(.top, 40)
                        .padding(.horizontal)
                    
                    
                    AboutView()
                        .padding()
                    
                    SkillsView()
                        
                    Spacer()
                    
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Vusal Nuriyev")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("iOS Developer")
                .font(.title2)
                .fontWeight(.light)
            Text("Baku | Open to work | 43M followers")
                .foregroundColor(Color.gray)
        }
    }
}

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.headline)
                .fontWeight(.bold)
                
            Text("I am iOS Developer and I am working hard to achieve what Allah has already written to me. Please, always be thankful to Allah!")
                .font(.footnote)
                .fontWeight(.light)
        }
    }
}

struct SkillsView: View {
    let skills = ["Swift", "Python", "Java", "JavaScript", "C++", "Ruby", "Go", "Rust"]
    @State private var showAll = false

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                    ForEach(skills.prefix(showAll ? skills.count : 6), id: \.self) { skill in
                        Text(skill)
                            .padding()
                            .background {
                                Capsule()
                                    .fill(Color(.systemBackground))
                                    .padding(.vertical, 9)
                                    .shadow(radius: 5)
                            }
                    }
                }
                .padding(.horizontal, 20)
                
                if skills.count > 6 && !showAll {
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



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
