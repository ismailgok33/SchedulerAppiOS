//
//  AddTaskHeaderView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct AddTaskHeaderView: View {
    var body: some View {
            
            VStack(alignment: .leading) {
                Text("Create")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("New Task")
                    .font(.title2)
                    .fontWeight(.thin)
            } //: VStack
            
    }
}

struct AddTaskHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskHeaderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
