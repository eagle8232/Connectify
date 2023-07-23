//
//  ExperienceView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 22.07.23.
//

import SwiftUI

struct VStackHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ExperienceView: View {
    var experience: ExperienceModel
    @State var height: CGFloat = 0
    var body: some View {
        
            
            HStack(alignment: .top, spacing: 5) {
                Image("line")
                    .resizable()
                    .frame(width: 15, height: height)
                   
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(experience.startDate.toString(format: "dd.MM.yyyy")) - \(experience.isPresent ? "Present" : "\(experience.endDate?.toString(format: "dd.MM.yyyy") ?? "")")")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(experience.companyName)
                        .font(.title3.weight(.regular))
                    Text(experience.role)
                        .font(.title2.weight(.bold))
                    Text(showSkills(skills: experience.skills))
                        .font(.footnote.weight(.light))
                }
                .background(
                    // Use the height of the VStack for alignment guide
                    GeometryReader { innerGeometry in
                        Color.clear.preference(key: VStackHeightKey.self, value: innerGeometry.size.height)
                    }
                )
            }
            .onPreferenceChange(VStackHeightKey.self) { height in
                // Here you can get the height of the VStack
                self.height = height + 10
            }
        
    }
    
    func showSkills(skills: [String]) -> String {
        let sortedSkills = "• \(skills.joined(separator: "\n• "))"
        return sortedSkills
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(experience: ExperienceModel(companyName: "ABB Bank", role: "iOS Developer", startDate: Date(), endDate: nil, isPresent: true, skills: ["Integrated existing third-party APIs to shorten development times.", "Researched and selected APIs for integration into development projects.", "Founded code review meetings to detect weaknesses in contributed program content, avoiding bug detection by users.", "Maintained existing mobile applications by designing patches to be applied via iOS automatic updates."]))
    }
}
