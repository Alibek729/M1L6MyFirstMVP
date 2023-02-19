//
//  Presenter.swift
//  M1L6MVP
//
//  Created by Alibek Kozhambekov on 19.02.2023.
//

import UIKit

/// Протокол для TaskPresenter.
protocol ITaskPresenter {
	func setup()
	func title(titleForHeaderSection section: Int) -> String?
	func numberOfSections() -> Int
	func numerOfRows(numerOfRowsInSection section: Int) -> Int
	func configureCell(indexPath: IndexPath) -> UITableViewCell
	func selectCell(indexPath: IndexPath)
}

/// Presenter заранее подготавливает данные и передает View.
final class TaskPresenter: ITaskPresenter {
	
	private var sectionForTaskManager: ISectionForTaskManagerAdapter!
	
	/// Return Task from indexPath.
	private func getTaskForIndex(_ indexPath: IndexPath) -> Task {
		sectionForTaskManager.getTasksForSection(section: indexPath.section)[indexPath.row]
	}
	
	/// Sets up ordered tasks.
	func setup() {
		let taskManager: ITaskManager = OrderedTaskManager(taskManager: TaskManager())
		let repository: ITaskRepository = TaskRepositoryStub()
		taskManager.addTasks(tasks: repository.getTasks())
		
		sectionForTaskManager = SectionForTaskManagerAdapter(taskManager: taskManager)
	}
	
	/// Creates titles for each section.
	func title(titleForHeaderSection section: Int) -> String? {
		sectionForTaskManager.getSectionsTitles()[section]
	}
	
	/// Returns number of sections.
	func numberOfSections() -> Int{
		sectionForTaskManager.getSectionsTitles().count
	}
	
	/// Returns number of rows in each section.
	func numerOfRows(numerOfRowsInSection section: Int) -> Int {
		sectionForTaskManager.getTasksForSection(section: section).count
	}
	
	
	/// Fills up each cell with data
	func configureCell(indexPath: IndexPath) -> UITableViewCell {
		
		let task = getTaskForIndex(indexPath)
		let cell = UITableViewCell()
		var contentConfiguration = cell.defaultContentConfiguration()
		
		if let task = task as? ImportantTask {
			let priorityText = "\(task.taskPriority)"
			let text = "\(priorityText) \(task.title)"
			
			let range = (text as NSString).range(of: priorityText)
			let mutableAttributedString = NSMutableAttributedString(string: text)
			mutableAttributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
			
			contentConfiguration.attributedText = mutableAttributedString
			contentConfiguration.secondaryText = "Deadline: " + task.deadLine.formatted()
			contentConfiguration.textProperties.color = task.deadLine < Date() ? .systemPink : .black
		} else {
			contentConfiguration.text = task.title
		}
		cell.tintColor = .black
		contentConfiguration.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
		contentConfiguration.textProperties.font = UIFont.boldSystemFont(ofSize: 19)
		cell.contentConfiguration = contentConfiguration
		cell.accessoryType =  task.completed ? .checkmark : .none
		return cell
	}
	
	
	/// Changes section of task when we tap on cell
	func selectCell(indexPath: IndexPath) {
		let task = getTaskForIndex(indexPath)
		task.completed.toggle()
	}
}
