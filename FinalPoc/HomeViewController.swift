//
//  HomeViewController.swift
//  FinalPoc
//
//  Created by Bia on 29/08/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var tasks: [Task] = {
        let tasks: [Task] = []
        return tasks
    }()
    
    lazy var rightBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(gotToAddTaskVC(_:)))
        barButton.tintColor = .orange
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = rightBarButton
        configTableView()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addTask(_ task: Task) {
        tasks.append(task)
        let indexPath = IndexPath(row: tasks.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
    }
    
    @objc func gotToAddTaskVC(_ sender: UIBarButtonItem) {
        let vc = UINavigationController(rootViewController: AddTaskViewController())
        present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].name
        cell.accessoryView = UIImageView.init(image: #imageLiteral(resourceName: "arrow"))
        cell.accessoryView?.tintColor = .orange
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: AddTaskViewControllerDelegate {
    func taskWasAdd(task: Task) {
        addTask(task)
    }
}
