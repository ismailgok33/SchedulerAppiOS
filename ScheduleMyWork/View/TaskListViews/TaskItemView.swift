//
//  TaskItemView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 29.10.2021.
//

import SwiftUI

struct TaskItemView: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Item
    var category: String
    @State var buttonTitle: String
    @State var buttonColor: Color
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            // MARK: - Checkbox
            
            Toggle(isOn: $item.completion) {
                
                VStack(alignment: .leading) {
                    
                    Text("\(category)")
                        .font(.system(.footnote, design: .rounded))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                        .foregroundColor(.blue)
                        .background(
                            Color.blue
                                .opacity(0.3)
                        )
                        .clipShape(Capsule())
                    
                    Text(item.task ?? "")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.vertical, 4)
                        .animation(.default)
                        .foregroundColor(item.completion ? Color.pink : Color.primary)
                } //:VStack
                
            } //: TOGGLE
            .toggleStyle(CheckboxStyle())
            .onReceive(item.objectWillChange, perform: { _ in
                if self.viewContext.hasChanges {
                    try? self.viewContext.save()
                }
            })
            
            Spacer()
            
            
            VStack(alignment: .center, spacing: 6) {
                ZStack {
                    Text(buttonTitle)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(buttonColor)
                        .padding(.horizontal, 12)
                } //: ZStack
                .background(
                    buttonColor
                        .opacity(0.3)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                
                
                Image(systemName: "person.2.fill")
                    .font(.title)
            } //: VStack
            
        } //:HStack
    }
}
