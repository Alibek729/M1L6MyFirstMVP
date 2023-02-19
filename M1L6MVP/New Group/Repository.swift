//
//  Repository.swift
//  M1L6MVP
//
//  Created by Alibek Kozhambekov on 19.02.2023.
//

import Foundation

/// Protocol for TaskRepositoryStub.
protocol ITaskRepository {
	func getTasks() -> [Task]
}


/// TaskRepositoryStub gets Important and Regular Tasks.
final class TaskRepositoryStub: ITaskRepository {
	func getTasks() -> [Task] {
		[
			ImportantTask(title: "Do homework", taskPriority: .high),
			RegularTask(title: "Do Workout", completed: true),
			ImportantTask(title: "Write new tasks", taskPriority: .low),
			RegularTask(title: "Solve 3 algorithms"),
			ImportantTask(title: "Go shopping", taskPriority: .medium)
		]
	}
}
