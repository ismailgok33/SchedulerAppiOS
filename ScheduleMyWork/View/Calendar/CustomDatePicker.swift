//
//  CustomDatePicker.swift
//  ScheduleMyWork
//
//  Created by İsmail on 21.11.2021.
//

import SwiftUI

struct CustomDatePicker: View {
    
    // MARK: - Properties
    
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    
    // MARK: - Body
    
    var body: some View {
        
        VStack(spacing: 35) {
            
            // Days
            let days : [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())

                    
                } //: VStack
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    currentMonth += 1
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
                
            }//: HStack
            .padding(.horizontal)
            
            // Day View
            HStack(spacing: 0) {
                
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                } //: Foreach
                
            } //: HStack
            
            //Dates
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()) { value in
                    cardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color.pink)
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 0.7 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            } //: LazyVGrid
            
            VStack(spacing: 15) {
                
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }) {
                    
                    ForEach(task.task) { task in
                        VStack(alignment: .leading, spacing: 10) {
                            
                            // For Custom timing
                            Text(task.time
                                    .addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                            
                            Text(task.title)
                                .font(.title2.bold())
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color.purple
                                .opacity(0.5)
                                .cornerRadius(10)
//                                .clipShape(Capsule())
                        )
                    }
                }
                else {
                    Text("No Task Found")
                }
                    
            } //: VStack
            .padding()
            
            
        }//: VStack
        .onChange(of: currentMonth) { newValue in
            // Updating month
            currentDate = getCurrentMonth()
        }
        
    }
    
    @ViewBuilder
    func cardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white :  Color.pink)
                        .frame(width: 8, height: 8)
                }
                else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date , date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        } //: VStack
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    // Check the dates for the same day
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    // Extracting Year and Month for display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        // Current Month
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else { return Date()}
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        // Current Month
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getCurrentDate().compactMap { date -> DateValue in
            
            // getting the day
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        // Adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
        
    }
}

// MARK: - Preview

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
//        CustomDatePicker(currentDate: .constant(Date()) ).previewLayout(.sizeThatFits)
//            .padding()
        
        CalendarView()
    }
}
