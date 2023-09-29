//
//  MenuController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 11.09.2023.
//

import UIKit

struct MenuItems {
    let icon: UIImage
    let title: String
}


class MenuController: UITableViewController {
    
    let menuItems =
    [
    MenuItems(icon: UIImage(named: "profile")!, title: "Profile"),
    MenuItems(icon: UIImage(named: "lists")!, title: "Lists"),
    MenuItems(icon: UIImage(named: "bookmarks")!, title: "Bookmarks"),
    MenuItems(icon: UIImage(named: "moments")!, title: "Moments")
    ]
    
        
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        view.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorStyle = .none

    }

    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = CustomMenuHeaderView()
        return customHeaderView
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCell(style: .default, reuseIdentifier: "cellID")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        let menuItem = menuItems[indexPath.row]
        cell.iconImageView.image = menuItem.icon
        cell.titleLabel.text = menuItem.title
       

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
//        let baseSlidingController = keyWindow?.rootViewController as? BaseSlidingController
        
        
    }
    
}
