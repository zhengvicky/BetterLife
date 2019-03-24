//
//  CalendarViewController.swift
//  BetterLife
//
//  Created by Vicky Zheng on 3/24/19.
//  Copyright © 2019 Vicky Zheng. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var 🍟: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        🍟 = ActivityData.shared.allActivities
        tableView.reloadData()
    }
}

extension CalendarViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 🍟.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") else {
            return UITableViewCell()
        }
        let event = 🍟[indexPath.row]
        cell.textLabel?.text = event.activity
        cell.detailTextLabel?.text = event.weekday
        cell.accessoryType = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        cell.accessoryType = cell.accessoryType == .checkmark ? .none : .checkmark
        
//        if cell.accessoryType == .checkmark {
//            cell.accessoryType = .none
//        } else {
//            cell.accessoryType = .checkmark
//        }
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            🍟.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
}
