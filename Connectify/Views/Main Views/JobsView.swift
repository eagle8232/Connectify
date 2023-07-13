//
//  JobsView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct JobsView: View {
    @StateObject private var viewModel = JobsViewModel()
    @State private var searchText = ""

    var body: some View {
            VStack {
                TextField("Search", text: $searchText, onCommit: {
                    viewModel.fetchJobs(with: searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                List(viewModel.filteredJobs) { job in
                    NavigationLink(destination: JobDetailsView(job: job)) {
                        HStack {
                            Image(job.photoName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .padding(.trailing, 10)

                            VStack(alignment: .leading) {
                                Text(job.title)
                                    .font(.headline)
                                Text(job.company)
                                    .font(.subheadline)
                                KeywordView(keywords: job.keywords)
                            }
                        }
                    }
                    .navigationTitle("Jobs")
                }
            }
        .onAppear {
            viewModel.fetchJobs()
        }
    }
}

struct JobDetailsView: View {
    let job: Job

    var body: some View {
        VStack(alignment: .leading) {
            Text(job.title)
                .font(.title)
                .padding(.bottom)
            Text(job.description)
                .font(.body)
                .padding(.bottom)
            KeywordView(keywords: job.keywords)
        }
        .padding()
        .navigationTitle("Job Details")
    }
}

struct KeywordView: View {
    let keywords: [String]

    var body: some View {
        HStack {
            ForEach(keywords, id: \.self) { keyword in
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(height: 25)
                    .overlay(
                        Text(keyword)
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding(5)
                    )
                    .padding(.trailing, 20)
            }
        }
    }
}

struct Job: Identifiable {
    let id = UUID()
    let title: String
    let company: String
    let description: String
    let keywords: [String]
    let photoName: String // Name of the photo for the job

    // Additional properties if needed

    init(title: String, company: String, description: String, keywords: [String], photoName: String) {
        self.title = title
        self.company = company
        self.description = description
        self.keywords = keywords
        self.photoName = photoName
    }
}

class JobsViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    @Published var filteredJobs: [Job] = []

    func fetchJobs() {
        jobs = [
            Job(title: "Software Engineer", company: "Acme Corporation", description: "We are seeking a talented software engineer...", keywords: ["Swift", "iOS", "Backend"], photoName: "job1"),
            Job(title: "iOS Developer", company: "ABB Bank", description: "We need an iOS Developer to join our team...", keywords: ["Xcode", "UIKit", "SwiftUI"], photoName: "job2"),
            Job(title: "Product Manager", company: "XYZ Inc.", description: "We are looking for an experienced product manager...", keywords: ["Product Strategy", "Agile", "Market Research"], photoName: "job3"),
            Job(title: "Graphic Designer", company: "Design Co.", description: "We need a creative graphic designer to join our team...", keywords: ["Adobe Creative Suite", "UI/UX", "Typography"], photoName: "job4")
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



struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        JobsView()
    }
}
