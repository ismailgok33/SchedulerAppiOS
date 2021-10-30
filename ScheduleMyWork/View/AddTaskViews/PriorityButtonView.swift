//
//  PriorityButtonView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 30.10.2021.
//

import SwiftUI

struct PriorityButtonView: View {
    
    // MARK: - Properties
    
    var buttonTitle: String
    var buttonColor: Color
    
    // MARK: - Body
    
    var body: some View {
        Button {
            // Select priority
        } label: {
            Text(buttonTitle)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(buttonColor)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
        } //: Button1
        .frame(minWidth: 100, idealWidth: 100, maxWidth: 150, minHeight: 40, idealHeight: 40, maxHeight: 60, alignment: .center)
        .background(
            buttonColor
                .opacity(0.3)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))

    }
}

// MARK: - Preview

struct PriorityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PriorityButtonView(buttonTitle: "High", buttonColor: Color.red)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
