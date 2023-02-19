//
//  SectionForTaskManagerAdapter.swift
//  M1L6MVP
//
//  Created by Alibek Kozhambekov on 19.02.2023.
//

import Foundation

/// Protocol for SectionForTaskManagerAdapter.
protocol ISectionForTaskManagerAdapter {
	func getSectionsTitles() -> [String]
	func getTasksForSection(section sectionIndex: Int) -> [Task]
}


/// Seperates tasks to completed and uncompleted.
final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	private let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	func getSectionsTitles() -> [String] {
		return ["Umcompleted", "Completed"]
	}
	
	func getTasksForSection(section sectionIndex: Int) -> [Task] {
		switch sectionIndex {
		case 1:
			return taskManager.completedTasks()
		default:
			return taskManager.uncompletedTasks()
		}
	}
}
