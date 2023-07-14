//
//  JobsViewModel.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 14.07.23.
//

import SwiftUI

class JobsViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    @Published var filteredJobs: [Job] = []
    
    func fetchJobs() {
        let jobs = [
            Job(title: "Software Engineer",
                company: "Acme Corporation",
                description: """
            We are seeking a talented software engineer to join our dynamic, fast-paced team. The candidate will be responsible for the entire software development life cycle, from concept to deployment. The successful applicant will have the ability to write effective, scalable code, refactor, optimize, and debug software systems. They will also work closely with our team of designers, developers, and project managers to ensure we meet customer expectations and achieve our company goals.
            """,
                requirements:
                    """
                    Bachelor's degree in Computer Science or related field is required,
                    3+ years experience in a software development role,
                    Deep knowledge of Swift and other programming languages,
                    Familiarity with various operating systems and platforms,
                    Experience with databases and Object-Relational Mapping (ORM) frameworks,
                    Excellent problem-solving, debugging, and troubleshooting skills
                    """
                ,
                keywords: ["Swift", "iOS", "Backend"],
                photoName: "job1"),
            
            Job(title: "iOS Developer",
               company: "ABB Bank",
               description: """
                        We need an iOS Developer to join our team, who will be responsible for developing applications for mobile devices powered by Apple's iOS operating system. The developer must be proficient with Swift and SwiftUI. They must also have a strong understanding of the patterns and practices that revolve around the iOS platform. The developer will also work closely with our product and design teams to build new features and interfaces.
                        """,
                requirements:
                    """
                    2+ years experience in iOS development is required",
                    Proficiency with Swift and SwiftUI is a must,
                    Familiarity with RESTful APIs to connect iOS applications to back-end services,
                    Understanding of Apple’s design principles and interface guidelines,
                    Experience with performance and memory tuning with tools,
                    Familiarity with cloud message APIs and push notifications
                    """,
                keywords: ["Xcode", "UIKit", "SwiftUI"],
                photoName: "job2"),
            
            Job(title: "Product Manager",
                company: "XYZ Inc.",
                description: """
                        We are looking for an experienced product manager to direct product development and ensure high return on investment (ROI). You’ll translate ideas into strategy and features, and follow product development from start to finish. To succeed in this role, you should be a perceptive and creative leader and a reliable problem-solver. If you’re also confident and have a knack for knowing what ideas will and won’t work, we’d like to meet you.
                        """,
                requirements:
                    """
                    3+ years of product management or related experience,
                    Experience in product lifecycle management
                    Background in software development and program management is preferred,
                    Familiarity with Agile framework and product management methodologies,
                    Excellent problem-solving, organizational and analytical skills,
                    Strong influencing, negotiation, and communication skills
                    """,
                keywords: ["Product Strategy", "Agile", "Market Research"],
                photoName: "job3"),
            
            Job(title: "Graphic Designer",
                company: "Design Co.",
                description: """
                        We need a creative graphic designer to join our team who can create visual concepts, by hand or using computer software, to communicate ideas that inspire, inform, or captivate consumers. They will work on a variety of products, including websites, books, magazines, product packaging, exhibitions, corporate identity, and more. The graphic designer should have an eye for clean and artful design, possess superior graphic design skills, and be able to translate high-level requirements into interaction flows and assets.
                        """,
                requirements:
                    """
                Proven graphic designing experience with a strong portfolio,
                Experience with design software and technologies (such as InDesign, Illustrator, Dreamweaver, Photoshop),
                A keen eye for aesthetics and details,
                Excellent communication skills,
                Ability to work methodically and meet deadlines,
                Degree in Design, Fine Arts or related field is a plus
                """
                ,
                keywords: ["Adobe Creative Suite", "UI/UX", "Typography"],
                photoName: "job4")
            
        ]
        
        
        filteredJobs = jobs
    }
    
    func fetchJobs(with searchText: String) {
        filteredJobs = jobs.filter { job in
            job.title.localizedCaseInsensitiveContains(searchText) ||
            job.company.localizedCaseInsensitiveContains(searchText) ||
            job.keywords.contains(where: { $0.localizedCaseInsensitiveContains(searchText) })
        }
    }
}
