//
//  TaskDetailView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 2.11.2021.
//

import SwiftUI

struct TaskDetailView: View {
    
    // MARK: - Properties
    @State var buttonTitle: String
    @State var buttonColor: Color
    
    // MARK: - Body
    
    var body: some View {
        // Header part
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .topLeading) {
                // Background
                Color(UIColor.systemGray4)
                    .ignoresSafeArea()
                
                // Image
                Image(systemName: "books.vertical")
                    .resizable()
                    .scaledToFit()
                .frame(minWidth: 0, idealWidth: 300, maxWidth: 450, minHeight: 0, idealHeight: 300, maxHeight: 45, alignment: .center)
                
                // Tag
                ZStack {
                    Text(buttonTitle)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(buttonColor)
                        .padding(.horizontal, 12)
                } //: ZStack
                .background(
                    buttonColor
                        .opacity(0.3)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                .padding(.horizontal)
                
            } //: ZStack
            .frame(height: 350)
            
            Spacer()
            
            // Detail part
            
            Text("Task Detail")
            
        } //: VStack
    }
}

// MARK: - Preview

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(buttonTitle: "work", buttonColor: Color.blue)
    }
}
