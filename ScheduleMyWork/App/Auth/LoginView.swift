//
//  LoginView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 1.11.2021.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @State private var email = ""
    @State private var password = ""
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // logo
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white)
                    
                    
                    VStack(spacing: 20) {
                        // email field
                        CustomTextFieldView(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // password field
                        CustomSecureFieldView(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    } //: VStack
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .padding(.trailing, 28)
                        }

                    }
                    
                    // sign in
                    Button {
                        // Sign In implementation
                    } label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 360, height: 50)
                            .background(Color.pink)
                            .clipShape(Capsule())
                            .padding()
                    }

                    Spacer()
                    
                    // switch to signup
                    NavigationLink {
                        SignUpView()
                            .navigationBarHidden(true)
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up!")
                                .font(.system(size: 14, weight: .semibold))
                        } //: HStack
                        .foregroundColor(.white)
                    } //: NavigationLink
                    .padding(.bottom, 32)

                    
                } //: VStack
                .padding(.top, -44)
            } //: ZStack
            
            
        } //: Navigation
        
        
        
        
    }
}

// MARK: - Preview

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
