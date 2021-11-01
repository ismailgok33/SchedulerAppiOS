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
    @State private var isSelectedSegment: Int = 0
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            
            // Header
            TaskListHeaderView(username: username)
            
            // Segmented Control
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
                    VStack(alignment: .leading, spacing: 1) {
                        Text("All")
                            .font(.title2)
                            .fontWeight(isSelectedSegment == 0 ? .bold : .thin)
                            .foregroundColor(isSelectedSegment == 0 ? Color.pink : Color.gray)
                        
                        if isSelectedSegment == 0 {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.pink)
                        } else {
                            Rectangle()
                                .frame(height: 0)
                        }
                        
                    } //: VStack
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.5)) {
                            isSelectedSegment = 0
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 1) {
                        Text("Today")
                            .font(.title2)
                            .fontWeight(isSelectedSegment == 1 ? .bold : .thin)
                            .foregroundColor(isSelectedSegment == 1 ? Color.pink : Color.gray)
                        
                        if isSelectedSegment == 1 {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.pink)
                        } else {
                            Rectangle()
                                .frame(height: 0)
                        }
                    } //: VStack
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.5)) {
                            isSelectedSegment = 1
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 1) {
                        Text("Upcoming")
                            .font(.title2)
                            .fontWeight(isSelectedSegment == 2 ? .bold : .thin)
                            .foregroundColor(isSelectedSegment == 2 ? Color.pink : Color.gray)
                        
                        if isSelectedSegment == 2 {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.pink)
                        } else {
                            Rectangle()
                                .frame(height: 0)
                        }
                    } // VStack
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.5)) {
                            isSelectedSegment = 2
                        }
                    }
                    
                }
                    
                
            } //: ScrollView
            .frame(height: 100)
            .padding(.horizontal, 20)
            
            // Item List
            List {
                ForEach(items, id: \.self) { item in
                    TaskItemView(item: item, category: "Work", buttonTitle: "High", buttonColor: Color.red)
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
