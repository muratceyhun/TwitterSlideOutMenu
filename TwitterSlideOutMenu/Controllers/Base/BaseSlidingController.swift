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
    
    
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        setupViews()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    var redViewLeadingConstraint: NSLayoutConstraint!
    var menuWidth: CGFloat = 300
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        x = min(menuWidth, x)
        redViewLeadingConstraint.constant = x
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
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth)
        ])
        
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        
        redViewLeadingConstraint.isActive = true
    }
    
    
    
}
