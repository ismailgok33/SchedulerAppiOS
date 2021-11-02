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
    @State var reminderOn: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        
        // MARK: - Header Part
        
        VStack(alignment: .leading, spacing: 18) {
            ZStack(alignment: .topLeading) {
                // Background
                Color(UIColor.systemGray4)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 8) {
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
                    
                    // Task name
                    Text("Task Name")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        
                    
                    // Image
                    Image(systemName: "books.vertical")
                        .resizable()
                        .scaledToFit()
                    .frame(minWidth: 0, idealWidth: 300, maxWidth: 450, minHeight: 0, idealHeight: 250, maxHeight: 250, alignment: .center)
                    
                    
                } //: VStack
                
                
            } //: ZStack
            .frame(minHeight: 0, idealHeight: 300, maxHeight: 350, alignment: .center)
            
            // MARK: - Detail Part
            
            // Reminder
            HStack {
                Spacer()
                
                Text("Set Reminder")
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.semibold)
                
                Toggle(isOn: $reminderOn) {
                    
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.gray))
                .frame(width: 50)
            } //: HStack
            .padding()
            
            // Hour
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: "clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                
                Text("11:00 - 12:00")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
            } //: HStack
            .padding(.horizontal, 20)
            
            // Date
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                
                Text("Tuesday, 02.11.2021")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
            } //: HStack
            .padding(.horizontal, 20)
            
            Divider()
            
            // Description
            VStack(alignment: .leading, spacing: 8) {
                Text("Description")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                
                Text("asdasdas dasda sd asd asdasda sda sdas das dasd asdasdasda sdasd asda sdas das daa sdasd asdasdasd asda ")
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
            } //: VStack
            .padding()
            
            Spacer()
            
        } //: VStack
    }
}

// MARK: - Preview

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(buttonTitle: "work", buttonColor: Color.blue)
    }
}
