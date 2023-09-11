//
//  HomeController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 3.09.2023.
//

import UIKit

class HomeController: UITableViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.backgroundColor = .gray
        setupNavigationItems()
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if gesture.state == .changed {
            
            print(translation)
            var x = translation.x
            x = min(menuWidth, x)
            x = max(0, x)
    //        menuController.view.transform = CGAffineTransform(translationX: translation.x, y: 0)
            navigationController?.view.transform = CGAffineTransform(translationX: x, y: 0)
        } else if gesture.state == .ended {
            handleOpen()
        }
    }
    
    
    let menuController = MenuController()
    fileprivate let menuWidth: CGFloat = 300
    

    fileprivate func setupNavigationItems() {
        
        navigationItem.title = "Home"
//        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
    }
    
    fileprivate func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            self.menuController.view.transform = transform
//            self.view.transform = transform
            self.navigationController?.view.transform = transform
        }
    }
    
    
    @objc fileprivate func handleOpen() {
        menuController.view.frame = CGRect(x: -menuWidth , y: 0, width: menuWidth, height: view.frame.height)

        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow?.addSubview(menuController.view)
        addChild(menuController)
        performAnimations(transform: CGAffineTransform(translationX: self.menuWidth, y: 0))
    }
    
    
    
    @objc fileprivate func handleHide() {
        performAnimations(transform: .identity)
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

