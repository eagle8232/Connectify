//
//  LoginView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 10.07.23.
//

import SwiftUI

struct LoginView: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    
    @State var isShowRegisterView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Image("ConnectifyTransparentLogo")
                        .resizable()
                        .frame(width: 190, height:190)
                        .padding(.bottom, -50)
                    Text("Connect with ease")
                        .font(.system(size: 25, weight: .bold))
                }
                
                VStack(alignment: .trailing) {
                    VStack(spacing: 15) {
                        //MARK: Email TextField
                        CTextField(placeholder: "Your email", text: $emailTextField)
                        
                        //MARK: Password TextField
                        CTextField(placeholder: "Your password", isSecure: true, text: $passwordTextField)
                    }
                    .padding()
                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password")
                    }
                    .padding(.trailing)
                    .padding(.bottom, 40)
                }
                    
                VStack(alignment: .center) {
                    //MARK: Log in Button
                    CButton(width: 250) {
                        
                    } label: {
                        Text("Sign In")
                            .font(.system(size: 20, weight: .bold))
                            .tint(Color.white)
                    }

                    
                }
                .padding(.bottom, 70)
                
                VStack {
                    Text("Or continue with")
                        .foregroundColor(Color.gray)
                        .font(.callout)
                        .padding()
                        .padding(.bottom, 30)
                    HStack(spacing: 30) {
                        //MARK: Facbook Logo
                        CButton(backgroundColor: .gray.opacity(0.4), width: 60, height: 60) {
                            
                        } label: {
                            Image("facebookLogo")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        
                        //MARK: Google Logo
                        CButton(backgroundColor: .gray.opacity(0.4), width: 60, height: 60) {
                            
                        } label: {
                            Image("googleLogo")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        
                        //MARK: Apple Logo
                        CButton(backgroundColor: .gray.opacity(0.4), width: 60, height: 60) {
                            
                        } label: {
                            Image("appleLogo")
                                .resizable()
                                .frame(width: 30, height: 35)
                        }
                    }
                }
                
                HStack {
                    Text("Didn't have an account?")
                        .foregroundColor(Color.gray)
                        .font(.callout)
                        
                    Spacer()
                    
                    Button {
                        isShowRegisterView = true
                    } label: {
                        Text("Sign Up")
                    }
                    
                }
                .padding(.top, 50)
                .padding()
                
            }
        }
        .fullScreenCover(isPresented: $isShowRegisterView) {
            RegisterView(isShowRegisterView: $isShowRegisterView)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
