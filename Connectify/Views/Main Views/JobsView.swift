//
//  JobsView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

//https://github.com/firebase/firebase-ios-sdk

import SwiftUI

struct JobsView: View {
    @StateObject private var viewModel = JobsViewModel()
    @Binding var tabBarVisible: Bool
    
    @State private var searchText = ""

    var body: some View {
            VStack {
                TextField("Search", text: $searchText, onCommit: {
                    viewModel.fetchJobs(with: searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                List(viewModel.filteredJobs) { job in
                    NavigationLink(destination: JobDetailsView(tabBarVisible: $tabBarVisible, job: job)) {
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
                }
            }
            .navigationTitle("Jobs")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchJobs()
            }
    }
}

struct KeywordView: View {
    let keywords: [String]

    var body: some View {
        HStack {
            ForEach(keywords, id: \.self) { keyword in
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(height: 35)
                    .overlay(
                        Text(keyword)
                            .foregroundColor(.white)
                            .lineLimit(20)
                            .font(.caption)
                            
                    )
                    .padding(.trailing, 20)
            }
        }
    }
}



struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        JobsView(tabBarVisible: .constant(true))
    }
}
