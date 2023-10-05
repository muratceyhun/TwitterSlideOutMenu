//
//  ChatroomMenuCell.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 5.10.2023.
//

import UIKit

class ChatroomMenuCell: UITableViewCell {
    
    let bgView: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.3132860959, green: 0.598976016, blue: 0.535128653, alpha: 1)
        v.layer.cornerRadius = 8
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(bgView)
        bgView.fillSuperview(padding: .init(top: 0, left: 8, bottom: 0, right: 8))
        sendSubviewToBack(bgView)
    }
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        bgView.isHidden = !selected
        
        
//        contentView.backgroundColor = selected ? .orange : .clear

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
