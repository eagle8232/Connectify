//
//  RegisterView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct RegisterView: View {
    @Binding var isShowRegisterView: Bool
    
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    
                    CButton(width: 45, height: 45) {
                        isShowRegisterView = false
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                    
                    Spacer()
                    
                }
                .padding()
                
                VStack {
                    
                    Text("Sign Up")
                        .font(.system(size: 33, weight: .black))
                        .fontWeight(.bold)
                    
                    VStack(spacing: 15) {
                        //MARK: Email TextField
                        CTextField(placeholder: "Your email", width: 320, text: $emailTextField)
                        
                        //MARK: Password TextField
                        CTextField(placeholder: "Your password", width: 320, isSecure: true, text: $passwordTextField)
                        
                        //MARK: Password Confirmation TextField
                        CTextField(placeholder: "Confirm your password", width: 320, isSecure: true, text: $passwordTextField)
                    }
                    .padding()
                    
                    CButton(width: 250) {
                        
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 20, weight: .bold))
                            .tint(Color.white)
                    }
                    
                }
                
                
                Spacer()
            }
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isShowRegisterView: .constant(true))
    }
}
