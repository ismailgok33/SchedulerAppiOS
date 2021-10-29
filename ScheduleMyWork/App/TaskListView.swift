//
//  TaskListView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct TaskListView: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    private var username: String = "Test User"
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            
            TaskListHeaderView(username: username)
            
            List {
                ForEach(items, id: \.self) { item in
                    TaskItemView(item: item, category: "Work")
                        .frame(height: 50)
                        .padding()
                        .background(
                            Color.white
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0, y: 4)
                }
                .onDelete(perform: deleteItems)
                .listRowBackground(Color(UIColor.systemGray6))

            } //: List
            .listStyle(.sidebar)
        } //: VStack
        .background(
            Color(UIColor.systemGray6)
                .ignoresSafeArea(.all, edges: .all)
        )
        
    }
    
    // MARK: - Functions// MARK: - Functions
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

// MARK: - Preview

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
