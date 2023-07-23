//
//  CTextField.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct CTextField: View {
    var placeholder: String = ""
    var color: Color = .clear
    var width: CGFloat = 290
    var height: CGFloat = 40
    var isSecure: Bool = false
    var passwordIconColor: Color = .gray
    
    @Binding var text: String
    
    @State private var isShowPassword: Bool = false
    @State private var showPasswordIcon: String = "eye.fill"
    
    var body: some View {
        if isSecure {
            SecureFieldView
        } else {
            GeneralFieldView
        }
    }
    
    private var SecureFieldView: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(color)
            .overlay {
                HStack {
                    if !isShowPassword {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                    Image(systemName: showPasswordIcon)
                        .foregroundColor(passwordIconColor)
                        .onTapGesture {
                            isShowPassword.toggle()
                            showPasswordIcon = isShowPassword ? "eye.slash.fill" : "eye.fill"
                        }
                }
                .padding(.horizontal)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 1.5)
            )
            .frame(width: width, height: height)
    }
    
    private var GeneralFieldView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color)
            .overlay {
                TextField(placeholder, text: $text)
                    .onSubmit {
                        
                    }
                    .padding(.leading)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 1.5)
            )
            .frame(width: width, height: height)
    }
}

struct CTextField_Previews: PreviewProvider {
    static var previews: some View {
        CTextField(text: .constant(""))
    }
}
