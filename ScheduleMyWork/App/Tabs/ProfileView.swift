//
//  ProfileView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 30.10.2021.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    
    @State var statTitle: String
    @State var statValue: String
    @State var isReminderOn: Bool = false
    
    
    // MARK: - Body
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack(alignment: .center, spacing: 30) {
                
                VStack {
                    Button {
                        // Log out
                    } label: {
                        Image(systemName: "power")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70, alignment: .center)
                            .foregroundColor(.gray)
                    } //: Button
                    
                    Text("Log out")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                } //: VStack
                
                
                Button {
                    // Open photo picker
                } label: {
                    VStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.black)
                        
                        Text("Test User")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    } //: VStack
                    
                } //: Button
                
                VStack {
                    Button {
                        // Share
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70, alignment: .center)
                            .foregroundColor(.gray)
                    } //: Button

                    Text("Share")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                } //: VStack
                
            } //: HStack
            
            HStack(spacing: 20) {

                TaskStatsView(title: $statTitle, value: $statValue)
                
                TaskStatsView(title: $statTitle, value: $statValue)
                
            } //: HStack
            .padding(.vertical)
            
            Form {
                Section {
                    HStack(spacing: 20) {
                        ZStack {
                            Color.blue
                                .opacity(0.3)
                            
                            Image(systemName: "alarm")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                        } //: ZStack
                        .frame(width: 45, height: 45)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                        Text("Reminders")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Toggle(isOn: $isReminderOn) {

                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                        
                    } //: HStack
                    .padding(.vertical, 5)
                } header: {
                    // No Header name
                } //: Section

                Section {
                    HStack(spacing: 20) {
                        ZStack {
                            Color.red
                                .opacity(0.3)
                            
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                        } //: ZStack
                        .frame(width: 45, height: 45)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                        Text("Notifications")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Toggle(isOn: $isReminderOn) {

                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color.red))
                        
                    } //: HStack
                    .padding(.vertical, 5)
                } header: {
                    // No Header name
                } //: Section
                
                Section {
                    HStack(spacing: 20) {
                        ZStack {
                            Color.green
                                .opacity(0.3)
                            
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                        } //: ZStack
                        .frame(width: 45, height: 45)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                        Text("Emails")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Toggle(isOn: $isReminderOn) {

                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color.green))
                        
                    } //: HStack
                    .padding(.vertical, 5)
                } header: {
                    // No Header name
                } //: Section
                
            } //: Form
            
            
        } //: VStack
        .padding(.vertical, 30)
        
        
        
        
    }
}

// MARK: - Preview

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(statTitle: "Task Done", statValue: "23424")
    }
}
