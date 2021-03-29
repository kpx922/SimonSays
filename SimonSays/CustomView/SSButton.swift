//
//  SSButton.swift
//  SimonSays
//
//  Created by Shihchiao Chao on 3/28/21.
//

import UIKit


class SSButton: UIButton {
    
    var color = UIColor()
    var glowColor = UIColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    convenience init(_ color: UIColor, _ glowColor: UIColor) {
        self.init(frame: .zero)
        
        self.color = color
        self.glowColor = glowColor
        
        backgroundColor = color
    }
    
    fileprivate func configure() {
        layer.cornerRadius = 10
    }
    
    func glow() {
        isSelected = !isSelected
        backgroundColor = isSelected ? glowColor : color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
