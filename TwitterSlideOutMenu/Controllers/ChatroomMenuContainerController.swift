//
//  ChatroomMenuContainerController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 6.10.2023.
//

import UIKit


class ChatroomMenuContainerController: UIViewController {
    
    
    let chatroomsMenuController = ChatroomsMenuController()
    let searchContainer = SearchContainerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.3074549437, green: 0.2199839652, blue: 0.2903968394, alpha: 1)
        let chatroomsView = chatroomsMenuController.view!
        view.addSubview(chatroomsView)
        view.addSubview(searchContainer)
        searchContainer.searchBar.delegate = chatroomsMenuController
        searchContainer.backgroundColor = #colorLiteral(red: 0.249730736, green: 0.1816008389, blue: 0.2514018416, alpha: 1)
    
    
        
        
        
        // WARNING !!!!
        
        
        let searchBar = UISearchBar()
        searchContainer.addSubview(searchBar)
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "dsadasad"

        searchContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 64))
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        chatroomsView.anchor(top: searchContainer.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
    }
    
    
    
    class SearchContainerView: UIView {
        
        let searchBar: UISearchBar = {
            let sb = UISearchBar()
            sb.searchBarStyle = .minimal
            sb.placeholder = "Enter for filtering..."
            return sb
        }()
        
        
        let rocketImageView: UIImageView = {
           let image = UIImageView(image: UIImage(named: "rocket"))
            image.contentMode = .scaleAspectFit
            image.layer.cornerRadius = 8
            image.clipsToBounds = true
            return image
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
            addSubview(searchBar)
            addSubview(rocketImageView)
            rocketImageView.anchor(top: nil, leading: safeAreaLayoutGuide.leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 10, right: 0), size: .init(width: 40, height: 40))
            searchBar.anchor(top: nil, leading: rocketImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 2, right: 0))

        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
    
    
    
    
    
    
    
}
