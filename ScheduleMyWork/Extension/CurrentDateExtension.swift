//
//  CurrentDateExtension.swift
//  ScheduleMyWork
//
//  Created by İsmail on 22.11.2021.
//

import SwiftUI

// MARK: - Current Date of month extension
extension Date {
    func getCurrentDate() -> [Date] {
        let calendar = Calendar.current
        
        // getting start Date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        // getting date
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
