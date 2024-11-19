//
//  Task.swift
//  Task Tracker
//
//  Created by Kaneis Zontanos on 11/19/24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var taskName: String
    var isCompleted: Bool = false
}
