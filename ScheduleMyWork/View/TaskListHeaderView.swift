//
//  TaskListHeaderView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 30.10.2021.
//

import SwiftUI

struct TaskListHeaderView: View {
    
    // MARK: - Properties
    
    var username: String
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 8) {
                Text("Hello")
                    .font(.system(size: 35, weight: .regular, design: .rounded))
                
                Text("\(username)")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
            } //: HStack
            
            Text("Here is your tasks...")
                .font(.headline)
                .fontWeight(.thin)
                .foregroundColor(.gray)
            
        }//: VStack
    }
}

// MARK: - Preview

struct TaskListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListHeaderView(username: "Test User")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
