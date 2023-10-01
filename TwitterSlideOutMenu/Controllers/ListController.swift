//
//  ListController.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 29.09.2023.
//

import UIKit

class ListController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        let label = UILabel()
        label.text = "List"
        label.font = UIFont.boldSystemFont(ofSize: 64)
        view.addSubview(label)
        label.frame = view.frame
        label.textAlignment = .center
        navigationItem.title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
