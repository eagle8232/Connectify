//
//  PostView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ProfileImage(image: "ConnectifyLogo")
                    VStack(alignment: .leading) {
                        Text("Vusal Nuriyev")
                            .font(.headline)
                        Text("Manager")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                    }
                    
                    Spacer()
                }
                
                
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 280)
                    .overlay {
                        Image("examplePostImage1")
                            .resizable()
                            .frame(height: 280)
                    }
                
                SocialButtons()
                
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.4))
                    .padding(-10)
            }
            .padding()
        }
    }
}

struct ProfileImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: 1.3)
            )
            .frame(width: 70, height: 70)
            .cornerRadius(35)
    }
}

struct SocialButtons: View {
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                //MARK: Like Button
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                //MARK: Share Button
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                //MARK: Comment Button
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Spacer()
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
