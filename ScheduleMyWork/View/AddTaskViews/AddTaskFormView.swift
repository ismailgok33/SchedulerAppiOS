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
    @EnvironmentObject var priority: Priority
    @Binding var taskDate: Date
    @Binding var taskTime: Date
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
        
            //Textfield
            TextField("Task name", text: $task)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            
            
            VStack(alignment: .leading) {
                
                Text("Priority")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(.horizontal)
                
                HStack(alignment: .center, spacing: 12) {
                    
                    PriorityButtonView(buttonTitle: "High", buttonColor: Color.red, isSelected: priority.priority == .high)
                    
                    PriorityButtonView(buttonTitle: "Medium", buttonColor: Color.orange, isSelected: priority.priority == .medium)
                    
                    PriorityButtonView(buttonTitle: "Low", buttonColor: Color.green, isSelected: priority.priority == .low)

                } //: HStack
                .padding(.horizontal)
            } //: VStack
            .padding(.vertical)
            
            
            VStack(alignment: .leading, spacing: 20) {
                // Calendar Date
//                AddTaskFormItemView(imageName: "calendar", title: "Friday, 25 October", color: Color.purple)
                
                HStack(alignment: .center) {
                   
                    DatePicker(selection: $taskDate, in: Date()..., displayedComponents: .date) {
                        
                        ZStack {
                            Circle()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.clear)
                                .background(
                                    Color.purple
                                        .opacity(0.25)
                                        .cornerRadius(25)
                                )
                            
                            Image(systemName: "calendar")
                                .font(.title2)
                                .foregroundColor(Color.purple)
                        } //: ZStack
                        
                    } //: DatePicker
                                            
                } //: HStack
                .padding(.vertical, 3)
                .padding(.horizontal, 20)
                
                // Time
//                AddTaskFormItemView(imageName: "clock", title: "11:15 - 12:00 AM", color: Color.pink)
                
                HStack(alignment: .center) {
                   
                    DatePicker(selection: $taskDate, displayedComponents: .hourAndMinute) {
                        
                        ZStack {
                            Circle()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.clear)
                                .background(
                                    Color.pink
                                        .opacity(0.25)
                                        .cornerRadius(25)
                                )
                            
                            Image(systemName: "clock")
                                .font(.title2)
                                .foregroundColor(Color.pink)
                        } //: ZStack
                        
                    } //: DatePicker
                                            
                } //: HStack
                .padding(.vertical, 3)
                .padding(.horizontal, 20)
                
                // Reminder
                HStack(alignment: .center, spacing: 5) {
                    AddTaskFormItemView(imageName: "bell", title: "Remind me", color: Color.blue)
                    
                    Toggle(isOn: $remindMe) {
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.blue))
//                    .frame(width: 50, height: 50, alignment: .center)
                }
            } //: VStack
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
            
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
            .padding(.bottom, 50)
        } //: VStack
        .padding(.vertical, 20)
        
        
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
        AddTaskFormView(taskDate: .constant(Date()), taskTime: .constant(Date()))
            .environmentObject(Priority())
            .previewLayout(.sizeThatFits)
    }
}
