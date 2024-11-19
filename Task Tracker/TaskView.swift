//
//  ContentView.swift
//  Task Tracker
//
//  Created by Kaneis Zontanos on 11/19/24.
//

import SwiftUI

struct TaskView: View {
    @StateObject private var taskVM = TaskViewModel()
    @State private var taskName = ""
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(taskVM.tasks, id: \.id) { item in
                        HStack(alignment: .center) {
                            Image(systemName: item.isCompleted ? "circle.fill" : "circle")
                                                        
                            Text("\(item.taskName)")
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(8)
                        .onTapGesture {
                            taskVM.toggleTaskCompletion(for: item)
                        }
                    }
                    .onDelete { indexSet in
                        taskVM.delTask(indexSet: indexSet)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Task Tracker")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    isSheetPresented = true
                } label: {
                    Text("Add Task")
                }
                .tint(.gray)
                .font(.title)
                .fontWeight(.heavy)
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $isSheetPresented) {
            TaskAddView(taskName: $taskName, taskAdd: {
                if !taskName.isEmpty {
                    taskVM.tasks.append(Task(taskName: taskName))
                }
            })
        }
    }
}


#Preview {
    TaskView()
}
