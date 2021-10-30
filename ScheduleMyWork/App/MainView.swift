//
//  MainView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            OverviewView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Overview")
                }
            
            TaskListView()
                .tabItem {
                    Image(systemName: "text.badge.checkmark")
                    Text("Tasks")
                }
            
            AddTaskView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("New Task")
                }
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Pofile")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
