//
//  AddTaskFormItemView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct AddTaskFormItemView: View {
    
    var imageName: String
    var title: String
    var color: Color
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.clear)
                    .background(
                        color
                            .opacity(0.25)
                            .cornerRadius(25)
                    )
                
                Image(systemName: imageName)
                .font(.title2)
                .foregroundColor(color)
            } //: ZStack
            
            Text(title)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
        } //: HStack
        .padding(.vertical, 3)
        .padding(.horizontal, 20)
    }
}

struct AddTaskFormItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskFormItemView(imageName: "calendar", title: "Friday, 25 October", color: Color.purple)
            .previewLayout(.sizeThatFits)
    }
}
