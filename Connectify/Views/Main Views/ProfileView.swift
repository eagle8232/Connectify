//
//  ProfileView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct ProfileView: View {
    @Binding var tabBarVisible: Bool
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    ZStack {
                        Image("profileBgImage")
                            .resizable()
                            .frame(height: 120)
                        HStack {
                            VStack {
                                Image("profileImage")
                                    .circularImage()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                Button {
                                    
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .background {
                                            Circle()
                                                .fill(Color(.systemBackground))
                                                .shadow(color: Color(.label), radius: 2)
                                                .padding(-5)
                                        }
                                }
                                .offset(x: 30, y: -30)
                                
                            }
                            
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
                    
                    ProfileContents()
                    
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
                                    .shadow(color: Color(.label), radius: 1)
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

struct ProfileContents: View {
    @State var currentTab: ContentTab = .posts
    
    @Namespace var animation
     
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 0){
                    CTabBarButton (currentTab: $currentTab, tab: .posts, animation: animation)
                    CTabBarButton(currentTab: $currentTab, tab: .experinces, animation: animation)
                }
                
                switch currentTab {
                case .posts:
                    ColorfulView()
                case .experinces:
                    ColorfulView()
                }
            }
        }
    }
}

struct ColorfulView: View {
    // Generate some random colors
    let colors: [Color] = (1...20).map { _ in Color(red: .random(in: 0..<4), green: .random(in: 0..<4), blue: .random(in: 0..<4)) }

    // Define the grid layout
    var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 20) {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(color)
                        .frame(height: 100)
                        .shadow(radius: 10)
                }
            }
            .padding(20)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(tabBarVisible: .constant(true))
    }
}
