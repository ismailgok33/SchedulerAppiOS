//
//  ContentView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 26.10.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - Properties
    
    @State var task: String = ""
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 16) {
                    TextField("New task", text: $task)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                    
                    Button {
                        addItem()
                    } label: {
                        Spacer()
                        Text("SAVE")
                        Spacer()
                    } //: Button
                    .disabled(isButtonDisabled)
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(isButtonDisabled ? Color.gray : Color.pink)
                    .cornerRadius(10)

                } //: VStack
                .padding()
                
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
            } //: VStack
            .navigationBarTitle("To Do List", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            } //: Toolbar
            Text("Select an item")
        } //: Navigation
    }
    
    // MARK: - Functions

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
        }
    }

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
