//
//  ChatroomsMenuController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 5.10.2023.
//

import UIKit

extension ChatroomsMenuController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var results = [[String]]()
        
        
        if searchText.isEmpty {
            filteredGroups = chatroomsGroups
            tableView.reloadData()
            return
        }
        
//        chatroomsGroups.forEach { group in
//            let filteredGroup = group.filter { chatroomName in
//                return chatroomName.lowercased().contains(searchText.lowercased())
//            }
//
//            results.append(filteredGroup)
//        }
//        print(results)
//        filteredGroups = results
        
        filteredGroups = chatroomsGroups.map({ group -> [String] in
            return group.filter {$0.lowercased().contains(searchText.lowercased())}
        })
        
        tableView.reloadData()

    }
    
}

class ChatroomsMenuController: UITableViewController {
    
    
    
    let chatroomsGroups =
    [
        ["general", "introductions"],
        ["jobs"],
        ["Joe Biden", "Tim Cook", "Steve Jobs", "Murat Ceyhun Korpeoglu"]
    ]
    
    var filteredGroups = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.3074549437, green: 0.2199839652, blue: 0.2903968394, alpha: 1)
        
        
        // This is making a copy, not a direct reference....
        filteredGroups = chatroomsGroups
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
    }
    
    
    fileprivate class ChatroomHeaderLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 12, dy: 0))
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let text = section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
        let label = ChatroomHeaderLabel()
        label.text = text
        label.textColor = #colorLiteral(red: 0.4322063625, green: 0.3539210558, blue: 0.4155536294, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.3074549437, green: 0.2199839652, blue: 0.2903968394, alpha: 1)
        return label
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredGroups.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)
        let text = filteredGroups[indexPath.section][indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [.foregroundColor: #colorLiteral(red: 0.4678531885, green: 0.4137479663, blue: 0.4577320218, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSAttributedString(string: text, attributes: [.foregroundColor : UIColor.white]))
        cell.textLabel?.attributedText = attributedText
        return cell
    }
}
