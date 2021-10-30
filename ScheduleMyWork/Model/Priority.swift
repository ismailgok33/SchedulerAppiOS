//
//  Priority.swift
//  ScheduleMyWork
//
//  Created by İsmail on 30.10.2021.
//

import Foundation

class Priority: ObservableObject {
    @Published var priority: PriorityType?
}

enum PriorityType: String {
    case high
    case medium
    case low
}
