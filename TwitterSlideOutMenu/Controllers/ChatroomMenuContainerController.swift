//
//  ChatroomMenuContainerController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 6.10.2023.
//

import UIKit


class ChatroomMenuContainerController: UIViewController {
    
    
    let chatroomsMenuController = ChatroomsMenuController()
    let searchContainer = UIView()
    let rocketImageView = UIImageView(image: #imageLiteral(resourceName: "rocket"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.3074549437, green: 0.2199839652, blue: 0.2903968394, alpha: 1)
        let chatroomsView = chatroomsMenuController.view!
        view.addSubview(chatroomsView)
//        chatroomsView.fillSuperview()
        view.addSubview(searchContainer)
        searchContainer.backgroundColor = #colorLiteral(red: 0.249730736, green: 0.1816008389, blue: 0.2514018416, alpha: 1)
        rocketImageView.contentMode = .scaleAspectFit
        rocketImageView.layer.cornerRadius = 4
        rocketImageView.clipsToBounds = true
        view.addSubview(rocketImageView)
        rocketImageView.anchor(top: nil, leading: view.leadingAnchor, bottom: searchContainer.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 8, right: 0), size: .init(width: 40, height: 40))
        
        
        
        // WARNING !!!!
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
        
        
        
        
        
        let searchBar = UISearchBar()
        searchContainer.addSubview(searchBar)
        searchBar.anchor(top: nil, leading: rocketImageView.trailingAnchor, bottom: searchContainer.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "dsadasad"

        searchContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 64))
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        chatroomsView.anchor(top: searchContainer.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
    }
}
