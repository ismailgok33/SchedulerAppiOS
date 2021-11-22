//
//  CalendarView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct CalendarView: View {
    
    // MARK: - Properties
    
    @State var currentDate: Date = Date()
    
    // MARK: - Body
    
    var body: some View {
        
        if #available(iOS 15.0, *) {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    CustomDatePicker(currentDate: $currentDate)
                } //: VStack
                .padding(.vertical)
                
            } //: ScrollView
            .safeAreaInset(edge: .bottom) {
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Text("Add Task")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.orange.opacity(0.7), in: Capsule())
                            
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Add Remainder")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.purple.opacity(0.7), in: Capsule())
                    }
                    
                } //: HStack
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
                
                
            }
        }
        else {
            
            // Fallback on earlier versions
            
        } //: SafeAreaInset
        
    }
}

// MARK: - Preview

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
