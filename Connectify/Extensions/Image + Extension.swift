//
//  Image + Extension.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 13.07.23.
//

import Foundation
import SwiftUI

extension Image {
    func circularImage() -> some View {
        self
            .resizable()
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: 1.3)
            )
            .clipShape(Circle())
    }
}
