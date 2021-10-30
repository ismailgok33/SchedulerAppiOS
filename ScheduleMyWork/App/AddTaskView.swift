//
//  AddTaskView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct AddTaskView: View {
    
    // MARK: - Properties
    
    @State var task: String = ""
    @EnvironmentObject var priority: Priority
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            
            Spacer()
            
            // Header
            AddTaskHeaderView()
            
            Spacer()
            
            // Bottom form
            AddTaskFormView()
                .padding()
                .background(
                    Color.white
                        .clipShape(CustomShape())
                )
            
        }) //: VStack
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color.gray
                .opacity(0.6)
                .ignoresSafeArea(.all, edges: .all)
        )
        
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
}

// MARK: - Preview

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(Priority())
    }
}
