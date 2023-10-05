//
//  ChatroomsMenuController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 5.10.2023.
//

import UIKit

class ChatroomsMenuController: UITableViewController {
    
    
    let chatroomsGroups =
    [
        ["general", "introductions"],
        ["jobs"],
        ["Joe Biden", "Tim Cook", "Steve Jobs", "Murat Ceyhun Korpeoglu"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.3074549437, green: 0.2199839652, blue: 0.2903968394, alpha: 1)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatroomsGroups.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroomsGroups[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let text = chatroomsGroups[indexPath.section][indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.text = text
        return cell
    }
}
