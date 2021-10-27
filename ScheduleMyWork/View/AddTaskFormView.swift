//
//  AddTaskFormView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct AddTaskFormView: View {
    
    // MARK: - Properties
    
    @State var task: String = ""
    
    @State var remindMe: Bool = false
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 12) {
        
            //Textfield
            TextField("Task name", text: $task)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                // Calendar Date
                AddTaskFormItemView(imageName: "calendar", title: "Friday, 25 October", color: Color.purple)
                
                // Time
                AddTaskFormItemView(imageName: "clock", title: "11:15 - 12:00 AM", color: Color.pink)
                
                // Reminder
                HStack(alignment: .center, spacing: 5) {
                    AddTaskFormItemView(imageName: "bell", title: "Remind me", color: Color.blue)
                    
                    Toggle(isOn: $remindMe) {
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.blue))
//                    .frame(width: 50, height: 50, alignment: .center)
                }
            }
            .padding(.horizontal, 20)
            
            // Button
            Button {
                addItem()
            } label: {
                Spacer()
                Text("Create Task")
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                Spacer()
            } //: Button
            .disabled(isButtonDisabled)
            .padding()
            .frame(width: 200, height: 50, alignment: .center)
            .font(.headline)
            .foregroundColor(.white)
            .background(isButtonDisabled ? Color.gray : Color.pink)
            .clipShape(Capsule())
        }
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

struct AddTaskFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskFormView()
            .previewLayout(.sizeThatFits)
    }
}