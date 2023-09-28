//
//  MenuItemCell.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 28.09.2023.
//

import UIKit

class IconImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        .init(width: 44, height: 44)
    }
}

class MenuItemCell: UITableViewCell {
    
    
    
    
    let iconImageView: IconImageView = {
        let iv = IconImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, UIView()])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // auto layout
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackView.spacing = 12
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
        
//        iconImageView.image = UIImage(named: "profile")
        titleLabel.text = "Profile"
        iconImageView.image = UIImage(named: "profile")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
