//
//  TaskStatsView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 8.11.2021.
//

import SwiftUI

struct TaskStatsView: View {
    
    // MARK: - Properties
    
    @Binding var title: String
    @Binding var value: String
    
    
    // MARK: - Body
    
    var body: some View {
            
            HStack {
                
                ZStack {
                    Color.red
                        .opacity(0.3)
                        .frame(width: 35, height: 35, alignment: .center)
                    
                    Image(systemName: "lineweight")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                } //: ZStack
                    
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.gray)
                    
                    Text(value)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.pink)
                } //: VStack
                .padding(5)
                
            } //: HStack
            .padding(5)
            .background(Color.white.cornerRadius(12))
            .background(
              RoundedRectangle(cornerRadius: 12)
            )
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
       
    }
}

// MARK: - Preview

struct TaskStatsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskStatsView(title: .constant("Task Done"), value: .constant("23424"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
