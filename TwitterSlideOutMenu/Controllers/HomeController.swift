//
//  HomeController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 3.09.2023.
//

import UIKit

class HomeController: UITableViewController, UIGestureRecognizerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.backgroundColor = .red
        setupNavigationItems()
    }


  
    fileprivate func setupNavigationItems() {
        
        navigationItem.title = "Home"
        setupCircularNavButton()
//        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
    }
    
    fileprivate func setupCircularNavButton() {
        
        let customView = UIButton(type: .system)
        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        
        customView.imageView?.image = UIImage(named: "cat") // This is not what you want....
        customView.setImage(UIImage(named: "cat")?.withRenderingMode(.alwaysOriginal), for: .normal)
        customView.contentMode = .scaleAspectFit
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        
        //This doesn't work as well...
//        customView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        customView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
        
        
        
        
        // option #1 that doen't work...
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "mck")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleOpen))
    }
    
    

    
    
    @objc fileprivate func handleOpen() {
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        (keyWindow?.rootViewController as? BaseSlidingController)?.openMenu()

    }
    
    
    
    @objc fileprivate func handleHide() {
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        (keyWindow?.rootViewController as? BaseSlidingController)?.closeMenu()
       
    }
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
//        let cell2 = UITableViewCell(style: .default, reuseIdentifier: "cellID") You don't need to register for prototype cells.
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

