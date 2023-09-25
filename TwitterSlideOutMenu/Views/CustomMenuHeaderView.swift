//
//  CustomMenuHeaderView.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 25.09.2023.
//

import UIKit


class CustomMenuHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        backgroundColor = .white
        
        
        
        let nameLabel = UILabel()
        nameLabel.text = "Brian Voong"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        let usernameLabel = UILabel()
        usernameLabel.text = "@buildthatapp"
        
        let statsLabel = UILabel()
        statsLabel.text = "303 Following 2910 Followers"
        
        // This is a spacing hack with UIView
        let arrangedSubviews = [
            UIView(), nameLabel, usernameLabel, UIView(), SpacerView(space: 30), statsLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 4
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true // Padding for stackviews.
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
