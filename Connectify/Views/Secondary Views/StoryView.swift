//
//  StoryView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct StoryView: View {
    @State var isShowStoryDetail: Bool = false
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<10, id: \.self) { i in
                        VStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.clear)
                                .frame(width: 80, height: 80)
                                .overlay {
                                    Image("ConnectifyLogo")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue, lineWidth: 1.3)
                                )
                                .onTapGesture {
                                    isShowStoryDetail = true
                                }
                            Text("Person \(i + 1)")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                }
                .padding()
            }
        }
        .fullScreenCover(isPresented: $isShowStoryDetail) {
            StoryDetailView(isShowStoryDetail: $isShowStoryDetail)
        }
    }
}

struct StoryDetailView: View {
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
                        StoryProfileView(image: "ConnectifyLogo")
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
            progressValue += 0.1
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
    var image: String
    
    var body: some View {
        ZStack {
            HStack {
                Image(image)
                    .circularImage()
                    .frame(width: 30, height: 30)
                    
                
                VStack(alignment: .leading) {
                    Text("Vusal Nuriyev")
                        .font(.caption)
                    Text(Date().toString())
                        .font(.caption2)
                        .foregroundColor(Color.gray)
                }
                
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
