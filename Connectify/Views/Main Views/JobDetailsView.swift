//
//  JobsDetailView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 14.07.23.
//

import SwiftUI

struct JobDetailsView: View {
    @Binding var tabBarVisible: Bool
    let job: Job
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(job.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                    VStack(alignment: .leading) {
                        HStack {
                            Image(job.photoName)
                                .circularImage()
                                .frame(width: 100, height: 100)
                            
                            VStack {
                                Text(job.company)
                                    .font(.headline)
                                    .fontWeight(.medium)
                                
                                VStack(alignment: .leading) {
                                    Text("Full-time")
                                    
                                    Text("Mid-Senior level")
                                    
                                    Text("1000 - 1600 employees")
                                }
                                .font(.caption)
                                .foregroundColor(Color.gray)
                            }
                        }
                        .padding(.leading)
                        
                        HStack {
                            Spacer()
                            
                            Text("245 applicants have applied - \(Date().toString())")
                                .fontWeight(.bold)
                        }
                        .padding(.trailing)
                        .font(.caption)
                        
                        .foregroundColor(Color.gray)
                    }
                    
                    Divider()
                    
                    VStack {
                        KeywordView(keywords: job.keywords)
                    }
                    .padding()
                }
                .padding(.bottom)
                
                
                
                VStack {
                    JobDescription(job: job)
                        .padding([.horizontal, .bottom])
                    
                    JobRequirements(job: job)
                        .padding(.horizontal)
                }
                
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemBackground))
                        .shadow(color: Color(.label), radius: 2)
                        .padding(-10)
                }
                .padding(.bottom, 120)
            }
            
            
            
            VStack {
                Spacer()
                
                CButton(backgroundColor: Color("mainColor"), width: 290) {
                    
                } label: {
                    Text("Apply now")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            .padding(.bottom, 40)
            
        }
        .ignoresSafeArea(edges: [.bottom])
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            tabBarVisible = false
        }
        .onDisappear {
            tabBarVisible = true
        }
    }
}

struct JobDescription: View {
    let job: Job
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text("Description")
                .font(.system(size: 16, weight: .bold))
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text(job.description)
                .font(.body)
        }
        
        
    }
}

struct JobRequirements: View {
    let job: Job
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Requirements")
                .font(.system(size: 16, weight: .bold))
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text(job.requirements)
                .font(.body)
            
        }
        
        
        
            
        
        
    }

}
