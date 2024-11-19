//
//  TaskViewModel.swift
//  Task Tracker
//
//  Created by Kaneis Zontanos on 11/19/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(taskName: String) {
        self.tasks.append(Task(taskName: taskName))
    }
    
    func delTask(indexSet: IndexSet) {
        self.tasks.remove(atOffsets: indexSet)
    }
    
    func toggleTaskCompletion(for task: Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].isCompleted.toggle()
        }
    }
}
