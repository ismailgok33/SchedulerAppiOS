//
//  AddTaskHeaderView.swift
//  ScheduleMyWork
//
//  Created by İsmail on 27.10.2021.
//

import SwiftUI

struct AddTaskHeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Spacer()
                Text("Create")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("New Task")
                    .font(.title2)
                    .fontWeight(.thin)
                Spacer()
            } //: VStack
            
            Spacer()
        } // HStack
        .background(
            Color.gray
                .cornerRadius(8)
                .opacity(0.6)
        )
    .ignoresSafeArea(.all).edgesIgnoringSafeArea(.all)
    }
}

struct AddTaskHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskHeaderView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
