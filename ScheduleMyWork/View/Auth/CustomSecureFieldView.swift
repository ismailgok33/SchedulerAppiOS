//
//  CustomSecureFieldView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 1.11.2021.
//

import SwiftUI

struct CustomSecureFieldView: View {
    
    // MARK: - Properties
    
    @Binding var text: String
    let placeholder: Text
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            // placeholder
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            } //: HStack
        } //: ZStack
    }
}

// MARK: - Preview

struct CustomSecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureFieldView(text: .constant(""), placeholder: Text("password"))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(backgroundGradient)
    }
}
