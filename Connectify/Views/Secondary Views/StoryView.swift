//
//  StoryView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct StoryView: View {
    var profile: ProfileModel
    @State var isShowStoryDetail: Bool = false
    var body: some View {
        ZStack {
            VStack {
                profile.profileImage?
                    .circularImage()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 75)
                    .cornerRadius(20)
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 1.7)
                    )
                    .onTapGesture {
                        isShowStoryDetail = true
                    }
                Text(profile.profileName)
                    .font(.system(size: 14, weight: .medium))
            }
        }
        .fullScreenCover(isPresented: $isShowStoryDetail) {
            StoryDetailView(profile: profile, isShowStoryDetail: $isShowStoryDetail)
        }
    }
}

struct StoryDetailView: View {
    var profile: ProfileModel
    @Binding var isShowStoryDetail: Bool
    var contentCount: Int = 8
    
    @State private var progressValue: Double = 0
    @State private var currentProgressIndex: Int = 0
    @State private var timer: Timer? = nil
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        ForEach(0..<contentCount, id: \.self) { index in
                            ProgressView("", value: currentProgressIndex == index ? progressValue : 1)
                                .tint(Color("mainColor"))
                                .frame(maxWidth: .infinity)
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Button(action: {
                            isShowStoryDetail = false
                        }) {
                            Image("backIcon")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 20, height: 20)
                        }
                        StoryProfileView(profile: profile)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .onAppear {
                    startAnimatingProgress()
                }
                
                HStack(spacing: 0) {
                    Color.clear
                        .frame(width: geometry.size.width / 2)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            
                            if currentProgressIndex > 0 {
                                timer?.invalidate()
                                progressValue = 0
                                currentProgressIndex -= 1
                                startAnimatingProgress()
                            }
                        }
                    
                    Color.clear
                        .frame(width: geometry.size.width / 2)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            
                            timer?.invalidate()
                            progressValue = 0
                            currentProgressIndex += 1
                            if currentProgressIndex >= contentCount {
                                currentProgressIndex = 0
                            }
                            startAnimatingProgress()
                        }
                }
                .frame(maxHeight: geometry.size.height - 150)
            }
        }
    }
    
    private func startAnimatingProgress() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            progressValue += 0.02
            if progressValue >= 1 {
                progressValue = 0
                currentProgressIndex += 1
                if currentProgressIndex >= contentCount {
                    currentProgressIndex = 0
                }
            }
        }
        timer?.fire()
    }
}






struct StoryProfileView: View {
    var profile: ProfileModel
    
    var body: some View {
        ZStack {
            HStack {
                profile.profileImage?
                    .circularImage()
                    .frame(width: 30, height: 30)
                
                
                VStack(alignment: .leading) {
                    Text(profile.profileName)
                        .font(.caption)
                    Text(Date().toString())
                        .font(.caption2)
                        .foregroundColor(Color.gray)
                }
                
            }
        }
    }
}
