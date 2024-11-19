//
//  TaskAddView.swift
//  Task Tracker
//
//  Created by Kaneis Zontanos on 11/19/24.
//

import SwiftUI

struct TaskAddView: View {
    @Binding var taskName: String
    @Environment(\.dismiss) private var dismiss
    var taskAdd: () -> Void
    
    var body: some View {
        TextField("Task:", text: $taskName)
            .textFieldStyle(.roundedBorder)
            .padding()
            .fontWeight(.medium)
            .font(.title2)
        
        Button{
            taskAdd()
            dismiss()
        } label: {
            Text("Add Task")
        }
        .tint(.gray)
        .font(.title)
        .fontWeight(.heavy)
    }
}

#Preview {
    TaskAddView(taskName: .constant(""), taskAdd: {})
}
