//
//  CommunityView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct CommunityView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @Binding var tabBarVisible: Bool
    @State var searchText: String = ""
    let people: [ProfileModel] = [
        .init(
            profileName: "Kamran Babayev",
            profileJob: "iOS Developer",
            profileLocation: "Baku",
            profileWorkStatus: "Open to work",
            profileFollowers: [],
            profileBio: nil,
            profileSkills: ["iOS", "Swift", "Xcode"],
            status: ProfileStatus.online,
            posts: [PostModel(
                text: "It is from Kamran Babayev",
                image: [Image("examplePostImage2")],
                comments: [
            .init(date: Date().addingTimeInterval(3600), profileName: "Chris Brown", text: "Wow, it looks so awesome!!!", likes: 2),
            .init(date: Date().addingTimeInterval(3600), profileName: "Vusal Nuriyev", text: "Allahu Akbar!!!", likes: 2000000)
        ])],
            experiences: [
            .init(companyName: "Kapital Bank", role: "iOS Developer", startDate: Date(), endDate: nil, isPresent: true, skills: ["Integrated existing third-party APIs to shorten development times.", "Researched and selected APIs for integration into development projects.", "Founded code review meetings to detect weaknesses in contributed program content, avoiding bug detection by users.", "Maintained existing mobile applications by designing patches to be applied via iOS automatic updates."
        ])]),
        .init(
            profileName: "Chris Brown",
            profileJob: "Software Developer",
            profileLocation: "USA",
            profileWorkStatus: "Open to work",
            profileFollowers: [],
            profileBio: nil,
            profileSkills: ["Python", "JavaScript", "VSCode"],
            status: ProfileStatus.offline,
            posts: [PostModel(
                text: "It is from Chris Brown",
                image: [Image("examplePostImage1")],
                comments: [
                .init(date: Date().addingTimeInterval(3600), profileName: "Kamran Babayev", text: "Wooow, it looks so awesome as well!!!", likes: 2)
            ])],
            experiences: [
            .init(companyName: "USA Bank", role: "Data Analyst", startDate: Date(), endDate: nil, isPresent: true, skills: [
                "Performed data cleaning, transformation, and validation to ensure data accuracy.",
                "Conducted exploratory data analysis to identify trends and patterns for business insights.",
                "Built and maintained data pipelines to automate data extraction, transformation, and loading processes.",
                "Utilized statistical methods to analyze large datasets and draw meaningful conclusions.",
                "Developed and presented data-driven reports and dashboards to support decision-making.",
                "Collaborated with cross-functional teams to define data requirements and improve data quality.",
                "Identified key performance indicators (KPIs) and implemented tracking mechanisms.",
                "Used data visualization tools to create compelling visual representations of data findings.",
                "Contributed to the development and optimization of machine learning models for predictive analytics.",
                "Stayed up-to-date with industry trends and best practices in data analysis and technology."
            ]
        )]
),
    ]
    
    var body: some View {
        VStack {
            VStack {
                CTextField(placeholder: "Search for people", width: .infinity, text: $searchText)
                    .padding([.horizontal, .top])
                ScrollView(.vertical) {
                    ForEach(people) { person in
                        if person.profileName.lowercased().contains(searchText.lowercased()) || searchText.isEmpty {
                            NavigationLink(
                                destination: CommunityProfileView(tabBarVisible: $tabBarVisible, profileModel: person)
                                    .environmentObject(profileManager)) {
                                        PeopleCellView(profileModel: person)
                                    }
                                    .padding([.top, .horizontal])
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            tabBarVisible = true
        }
        .navigationTitle("People")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PeopleCellView: View {
    var profileModel: ProfileModel
    var body: some View {
        HStack {
            profileModel.profileImage?
                .circularImage()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("mainColor"))
            VStack(alignment: .leading) {
                Text(profileModel.profileName)
                    .font(.system(size: 15, weight: .semibold))
                Text("\(profileModel.profileJob ?? ""), \(profileModel.profileLocation ?? "")")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 0.2)
                .padding(-10)
        }
        .padding(.horizontal)
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(tabBarVisible: .constant(true))
    }
}
