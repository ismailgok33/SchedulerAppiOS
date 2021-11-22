//
//  Task.swift
//  ScheduleMyWork
//
//  Created by İsmail on 21.11.2021.
//

import SwiftUI

// MARK: - Array of Tasks
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// MARK: - Total Task Meta View
struct TaskMetaDate: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

// MARK: - Sample Date for Testing
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// MARK: - Sample Tasks
var tasks : [TaskMetaDate] = [
    TaskMetaDate(task: [
        Task(title: "Do Homework"),
        Task(title: "Go To Sleep"),
        Task(title: "Do some workout")
    ], taskDate: getSampleDate(offset: 1)),
    
    TaskMetaDate(task: [
        Task(title: "Go to work")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaDate(task: [
        Task(title: "Play Video Games")
    ], taskDate: getSampleDate(offset: -8)),
    
    TaskMetaDate(task: [
        Task(title: "Go to go carting")
    ], taskDate: getSampleDate(offset: -15)),
    
    TaskMetaDate(task: [
        Task(title: "Watch movies")
    ], taskDate: getSampleDate(offset: -20))
]
