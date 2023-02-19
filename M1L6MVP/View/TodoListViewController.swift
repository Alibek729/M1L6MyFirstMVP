//
//  ViewController.swift
//  M1L6MVP
//
//  Created by Alibek Kozhambekov on 19.02.2023.
//

import UIKit

import UIKit

final class TodoListViewController: UITableViewController {
	
	private var taskPresenter: ITaskPresenter = TaskPresenter()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "TodoList"
		taskPresenter.setup()
	}
	
	// MARK: - Table view data source
	override func numberOfSections(in tableView: UITableView) -> Int {
		taskPresenter.numberOfSections()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		taskPresenter.numerOfRows(numerOfRowsInSection: section)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = taskPresenter.configureCell(indexPath: indexPath)
		return cell
	}
	
	//MARK: - Table View Delegate
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		taskPresenter.title(titleForHeaderSection: section)
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		taskPresenter.selectCell(indexPath: indexPath)
		tableView.reloadData()
	}
}

