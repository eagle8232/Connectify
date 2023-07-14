//
//  CButton.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct CButton<Label: View>: View {
    var backgroundColor: Color
    var tintColor: Color
    var width: CGFloat
    var height: CGFloat
    var action: () -> Void
    var label: () -> Label
    
    init(
        backgroundColor: Color = Color("mainColor").opacity(0.6),
        tintColor: Color = Color.white,
        width: CGFloat = 100,
        height: CGFloat = 50,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.width = width
        self.height = height
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button(action: action) {
            label()
                .foregroundColor(tintColor)
                .frame(width: width, height: height)
                .background(RoundedRectangle(cornerRadius: 20).fill(backgroundColor))
        }
    }
}

struct CButton_Previews: PreviewProvider {
    static var previews: some View {
        CButton(action: {}) {
            Text("Hello")
        }
    }
}
