//
//  ScheduleMyWorkApp.swift
//  ScheduleMyWork
//
//  Created by İsmail on 26.10.2021.
//

import SwiftUI

@main
struct ScheduleMyWorkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(Priority())
        }
    }
}
