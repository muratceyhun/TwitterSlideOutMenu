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
        view.backgroundColor = .cyan
        setupNavigationItems()
        setupPanGesture()
//        setupMenuController()
    }
    
    override func viewDidLayoutSubviews() {
        setupDarkCoverView()
        setupMenuController()
    }
    
    
    let darkCoverView = UIView()

    fileprivate func setupDarkCoverView() {
        darkCoverView.alpha = 0

        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
 
        darkCoverView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        darkCoverView.isUserInteractionEnabled = false
        keyWindow?.addSubview(darkCoverView)
        darkCoverView.frame = keyWindow?.frame ?? .zero
        
    }

      
    
    let menuController = MenuController()
    fileprivate let menuWidth: CGFloat = 300
    fileprivate var velocityOpenThresholl: CGFloat = 500
    fileprivate var isMenuOpened = false
    
    fileprivate func setupPanGesture() {
        //        setupMenuController()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        panGesture.delegate = self
        view.addGestureRecognizer(panGesture)
    }
    
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
////      This is hard to apply bc you have to calculate manually new frames.
//    }
    
    

    
    
    
    fileprivate func setupMenuController() {
        
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow?.addSubview(menuController.view)
//        addChild(menuController)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {

        let translation = gesture.translation(in: view)

        if gesture.state == .changed {

            print(translation)
            var x = translation.x
            if isMenuOpened {
                x = x + menuWidth
            }
            x = min(menuWidth, x)
            x = max(0, x)
            let transform = CGAffineTransform(translationX: x, y: 0)
            menuController.view.transform = transform
            navigationController?.view.transform = transform
            darkCoverView.transform = transform
            
            darkCoverView.alpha = x / menuWidth
            
            
        } else if gesture.state == .ended {
           handleEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        print(translation.x)
        print("velocity", velocity)
        
        if isMenuOpened {
            
            if abs(velocity.x) > velocityOpenThresholl {
                handleHide()
                return
            }
            
            if abs(translation.x) < menuWidth / 2 {
                handleOpen()
            } else {
                handleHide()
            }
            
        } else {
            
            if velocity.x > velocityOpenThresholl {
                handleOpen()
                return
            }
            
            if translation.x < menuWidth/2 {
                handleHide()
            } else {
                handleOpen()
            }
        }
    }
    
  
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
            self.darkCoverView.alpha = transform == .identity ? 0 : 1
        }
    }
    
    
    @objc fileprivate func handleOpen() {
        
//        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
//        let keyWindow = UIApplication.shared.connectedScenes
//            .filter({$0.activationState == .foregroundActive})
//            .compactMap({$0 as? UIWindowScene})
//            .first?.windows
//            .filter({$0.isKeyWindow}).first
//        keyWindow?.addSubview(menuController.view)
     
        performAnimations(transform: CGAffineTransform(translationX: self.menuWidth, y: 0))
        isMenuOpened = true
    }
    
    
    
    @objc fileprivate func handleHide() {
        
        performAnimations(transform: .identity)
        isMenuOpened = false
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

