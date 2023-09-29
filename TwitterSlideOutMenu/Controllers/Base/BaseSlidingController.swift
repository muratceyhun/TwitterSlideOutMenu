//
//  BaseSlidingController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 24.09.2023.
//

import UIKit


class BaseSlidingController: UIViewController {
    
    
    let redView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    let blueView: UIView = {
       let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    let darkCoverView: UIView = {
       let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 0.7)
        v.alpha = 0
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        setupViews()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    var redViewLeadingConstraint: NSLayoutConstraint!
    var velocityThreshold: CGFloat = 500
    var menuWidth: CGFloat = 300
    var isMenuOpened = false
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        x = isMenuOpened ? x + menuWidth : x
        x = min(menuWidth, x)
        x = max(0, x)
        redViewLeadingConstraint.constant = x
        darkCoverView.alpha = x / menuWidth
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
                
    @objc fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpened {
            if abs(velocity.x) > velocityThreshold {
                closemenu()
                return
            }
            
            if abs(translation.x) < menuWidth/2 {
                openMenu()
            } else {
                closemenu()
            }
        } else {
            if abs(velocity.x) > velocityThreshold {
                openMenu()
                return
            }
            
            if translation.x < menuWidth / 2 {
                closemenu()
            } else {
                openMenu()
            }
        }
    }
    
    
    func openMenu() {
        isMenuOpened = true
        redViewLeadingConstraint.constant = menuWidth
        performAnimations()
        
    }
    
    func closemenu() {
        isMenuOpened = false
        redViewLeadingConstraint.constant = 0
        performAnimations()
    }
    
    
    func didSelectMenuItem(indexPath: IndexPath) {
//        print("Selected Menu Item: \(indexPath.row)")
        switch indexPath.row {
        case 0:
            print("Show Home Screen")
        case 1:
            print("Show List Screen")
            let listController = ListController()
            redView.addSubview(listController.view)
        case 2:
            let bookmarksController = UIViewController()
            bookmarksController.view.backgroundColor = .green
            redView.addSubview(bookmarksController.view)
            print("Show Bookmarks Screen")
        default:
            print("Show Moments Screen")
        }
        
        redView.bringSubviewToFront(darkCoverView)
        closemenu()
        
         
        
    }
    
    fileprivate func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.view.layoutIfNeeded()
            self.darkCoverView.alpha = self.isMenuOpened ? 1 : 0
        }
    }
    
    func setupViews() {
        view.addSubview(redView)
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth)
        ])
        
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        
        redViewLeadingConstraint.isActive = true
        
        setupViewControllers()
    }
    
    
    fileprivate func setupViewControllers() {
        
        let homeController = HomeController()
        let menuController = MenuController()

        let homeView = homeController.view!
        let menuView = menuController.view!
        
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.addSubview(homeView)
        redView.addSubview(darkCoverView)
        blueView.addSubview(menuView)
        
        NSLayoutConstraint.activate([
            // top, leading, bottom, trailing anchors
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            
            menuView.topAnchor.constraint(equalTo: blueView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),
            
            darkCoverView.topAnchor.constraint(equalTo: redView.topAnchor),
            darkCoverView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            darkCoverView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            darkCoverView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            ])
        
        addChild(homeController)
        addChild(menuController)
        
        
    }
}
