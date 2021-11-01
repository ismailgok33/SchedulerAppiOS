//
//  Constant.swift
//  ScheduleMyWork
//
//  Created by İsmail on 29.10.2021.
//

import SwiftUI

// MARK: - FORMATTER

let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

// LAYOUT

let columnSpacing: CGFloat = 20
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
}

// MARK: - UI

var backgroundGradient: LinearGradient {
  return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .top, endPoint: .bottom)
}

// MARK: - UX

let feedback = UINotificationFeedbackGenerator()
