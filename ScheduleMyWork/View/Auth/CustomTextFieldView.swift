//
//  CustomTextFieldView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 1.11.2021.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    // MARK: - Properties
    
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
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
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            } //: HStack
        } //: ZStack
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(backgroundGradient)
    }
}
