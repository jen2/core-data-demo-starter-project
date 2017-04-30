//
//  ViewController.swift
//  Core-Data-Demo
//
//  Created by Jennifer A Sipila on 3/15/17.
//  Copyright © 2017 Jennifer A Sipila. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var tasks:Array<String> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if textField.text != "" {
            self.tasks.append(textField.text!)
            taskTableView.reloadData()
        } else {
            //Add Alert: "Please add a task name."
            print("Please add a task name")
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! TaskListTableViewCell
        cell.taskLabel.text = self.tasks[indexPath.row]
        return cell
    }
}

