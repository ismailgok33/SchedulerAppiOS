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
    @State var selectedPriority: Int?
    @State var isHighSelected: Bool
    
    @State var isMediumSelected: Bool
    
    @State var isLowSelected: Bool
    
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
                    
                    PriorityButtonView(buttonTitle: "High", buttonColor: Color.red, isSelected: $isHighSelected)
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.5)) {
                                selectedPriority = 0
                                isHighSelected = true
                                isMediumSelected = false
                                isLowSelected = false
                            }
                        }
                    
                    PriorityButtonView(buttonTitle: "Medium", buttonColor: Color.orange, isSelected: $isMediumSelected)
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.5)) {
                                selectedPriority = 1
                                isHighSelected = false
                                isMediumSelected = true
                                isLowSelected = false
                            }
                        }
                    
                    PriorityButtonView(buttonTitle: "Low", buttonColor: Color.green, isSelected: $isLowSelected)
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.5)) {
                                selectedPriority = 2
                                isHighSelected = false
                                isMediumSelected = false
                                isLowSelected = true
                            }
                        }

                } //: HStack
                .padding(.horizontal)
            } //: VStack
            .padding(.vertical)
            
            
            VStack(alignment: .leading, spacing: 20) {
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
        AddTaskFormView(isHighSelected: false, isMediumSelected: false, isLowSelected: false)
            .previewLayout(.sizeThatFits)
    }
}
