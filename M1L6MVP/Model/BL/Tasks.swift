//
//  Tasks.swift
//  M1L6MVP
//
//  Created by Alibek Kozhambekov on 19.02.2023.
//

import Foundation

/// Task Model.
class Task {
	var title: String
	var completed = false
	
	init(title: String, completed: Bool = false) {
		self.title = title
		self.completed = completed
	}
}

/// Regular tasks with no time limit.
final class RegularTask: Task { }

/// Tasks with deadlines and priority.
final class ImportantTask: Task {
	enum TaskPriority: Int {
		case low
		case medium
		case high
	}
	
	var deadLine: Date {
		switch taskPriority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: Date())!
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: Date())!
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: Date())!
		}
	}
	
	var taskPriority: TaskPriority
	
	init(title: String, taskPriority: TaskPriority) {
		self.taskPriority = taskPriority
		super.init(title: title)
	}
}
