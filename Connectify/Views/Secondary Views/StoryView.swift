//
//  StoryView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<10, id: \.self) { i in
                        VStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.clear)
                                .frame(width: 90, height: 90)
                                .overlay {
                                    Image("ConnectifyLogo")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue, lineWidth: 1.3)
                                )
                            Text("Person \(i + 1)")
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
