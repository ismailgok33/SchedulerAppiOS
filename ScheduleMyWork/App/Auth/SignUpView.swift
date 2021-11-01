//
//  SignUpView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 1.11.2021.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - Properties
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    
    var body: some View {
        
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
                    
                    // username field
                    CustomTextFieldView(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // fullname field
                    CustomTextFieldView(text: $fullname, placeholder: Text("Fullname"), imageName: "person")
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
                
                // sign in
                Button {
                    //Sign Up implementation
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 360, height: 50)
                        .background(Color.pink)
                        .clipShape(Capsule())
                        .padding()
                }

                Spacer()
                
                // switch to signin
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    } //: HStack
                    .foregroundColor(.white)
                } // Button
                .padding(.bottom, 32)


                
            } //: VStack
            .padding(.top, 20)
            
        } //: ZStack
        
    }
}

// MARK: - Preview

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
