//
//  ViewController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 3.09.2023.
//

import UIKit

class ViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.backgroundColor = .red
        setupNavigationItems()
    }
    
    fileprivate func setupNavigationItems() {
        
        navigationItem.title = "Home"
//        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
    }
    
    
    @objc fileprivate func handleHide() {
        print("Hide button pressed.")
    }
    
    @objc fileprivate func handleOpen() {
        
        let vc = MenuController()
        
        vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: view.frame.height)
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        
        keyWindow?.addSubview(vc.view)
                
        
//        view.addSubview(vc.view)
        
        
        
        
        print("Open button pressed.")
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

