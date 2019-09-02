//
//  HomeViewController.swift
//  FinalPoc
//
//  Created by Bia on 29/08/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    lazy var tasks: [String] = {
        let tasks = ["Limpar a mesa"]
        return tasks
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        cell.accessoryView = UIImageView.init(image: #imageLiteral(resourceName: "arrow"))
        cell.accessoryView?.tintColor = .orange
        
        return cell
    }
}
