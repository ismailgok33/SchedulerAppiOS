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
        
        ScrollView(.vertical, showsIndicators: false) {
            
            CustomDatePicker(currentDate: $currentDate)
            
        } //: ScrollView
        
    }
}

// MARK: - Preview

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
