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
    
    // MARK: - Body
    
    var body: some View {
        List {
            ForEach(items) { item in
                NavigationLink {
                    VStack(alignment: .leading) {
                        Text(item.task ?? "")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                } label: {
                    VStack(alignment: .leading) {
                        Text(item.task ?? "")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(item.timestamp!, formatter: itemFormatter)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    } //: List Item
                }
            }
            .onDelete(perform: deleteItems)
        } //: List
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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - Preview

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
