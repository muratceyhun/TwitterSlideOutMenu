//
//  CustomMenuHeaderView.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 25.09.2023.
//

import UIKit


class CustomMenuHeaderView: UIView {
    
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let statsLabel = UILabel()
    let profileImageView = ProfileImageView()

    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupComponentProp()
        setupStackView()
        setupStatsAttributedText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupStatsAttributedText() {
        let attributedText = NSMutableAttributedString(string: "303  ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "Following  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))
        attributedText.append(NSAttributedString(string: "2910  ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]))
        attributedText.append(NSAttributedString(string: "Followers", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))
        statsLabel.attributedText = attributedText
    }
    
    fileprivate func setupComponentProp() {
        nameLabel.text = "Brian Voong"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        usernameLabel.text = "@buildthatapp"
        statsLabel.text = "303 Following 2910 Followers"
        profileImageView.image = UIImage(named: "image1")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.clipsToBounds = true
    }
    
    fileprivate func setupStackView() {
        // This is a spacing hack with UIView
        let rightSpacerView = UIView()
        let arrangedSubviews = [
            UIStackView(arrangedSubviews: [profileImageView, rightSpacerView]),
            nameLabel,
            usernameLabel,
            SpacerView(space: 30),
            statsLabel
        ]
        
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
    
    
}
