//
//  SpacerView.swift
//  TwitterSlideOutMenu
//
//  Created by Murat Ceyhun Korpeoglu on 26.09.2023.
//

import UIKit


class SpacerView: UIView {
    
    
    let space: CGFloat
    
    
    override var intrinsicContentSize: CGSize {
        return .init(width: space, height: space)
    }
    
    
    init(space: CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
