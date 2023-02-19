//
//  TaskManager.swift
//  M1L6MVP
//
//  Created by Alibek Kozhambekov on 19.02.2023.
//

import Foundation

/// Предоставляет список заданий.
final class TaskManager {
	private var taskList = [Task]()

	/// - Returns: All Tasks.
	public func allTasks() -> [Task] {
		taskList
	}
	
	/// - Returns: Completed tasks.
	public func completedTasks() -> [Task] {
		taskList.filter { $0.completed }
	}
	
	/// - Returns: Uncompleted Tasks.
	public func uncompletedTasks() -> [Task] {
		taskList.filter { !$0.completed }
	}
	
	/// Adds Task to List.
	/// - Parameter task: Type of Task class.
	public func addTask(task: Task) {
		taskList.append(task)
	}
	
	public func addTasks(tasks: [Task]) {
		taskList.append(contentsOf: tasks)
	}
	
	/// Removes Task.
	/// - Parameter task: Type of Task class.
	public func removeTask(task: Task) {
		taskList.removeAll { $0 === task }
	}
}
