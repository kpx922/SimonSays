//
//  SimonSaysView.swift
//  SimonSays
//
//  Created by Shihchiao Chao on 3/28/21.
//

import UIKit

class SimonSaysView: UIView {
    
    lazy var highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "High Score: -"
        label.font = UIFont(name: Font.Arcade, size: 14)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: Font.Arcade, size: 30)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var yellowButton: SSButton = {
        return SSButton(SSColor.Yellow, SSColor.LightYellow)
    }()
    
    lazy var redButton: SSButton = {
        return SSButton(SSColor.Red, SSColor.LightRed)
    }()
    
    lazy var greenButton: SSButton = {
        return SSButton(SSColor.Green, SSColor.LightGreen)
    }()
    
    lazy var blueButton: SSButton = {
        return SSButton(SSColor.Blue, SSColor.LightBlue)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutView()
    }
    
    fileprivate func layoutView() {
        let padding: CGFloat = 12
        let buttonWidth  = (Screen.Width - (padding * 3)) / 2
        let buttonHeight = Screen.Height * 0.25
        
        addSubviews(highScoreLabel, scoreLabel, greenButton, blueButton, yellowButton, redButton)
        
        _ = highScoreLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: padding, left: 0, bottom: 0, right: padding), size: .init(width: 0, height: 24))
        
        _ = greenButton.anchor(top: nil, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 0, left: padding, bottom: padding * 4, right: 0), size: .init(width: buttonWidth, height: buttonHeight))
        
        _ = blueButton.anchor(top: nil, leading: greenButton.trailingAnchor, bottom: greenButton.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: buttonHeight))
        
        _ = yellowButton.anchor(top: nil, leading: greenButton.leadingAnchor, bottom: greenButton.topAnchor, trailing: greenButton.trailingAnchor, padding: .init(top: 0, left: 0, bottom: padding, right: 0), size: .init(width: 0, height: buttonHeight))
            
        _ = redButton.anchor(top: yellowButton.topAnchor, leading: blueButton.leadingAnchor, bottom: yellowButton.bottomAnchor, trailing: blueButton.trailingAnchor)
        
        _ = scoreLabel.anchor(top: nil, leading: leadingAnchor, bottom: yellowButton.topAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: padding * 6, right: 0), size: .init(width: 0, height: 34))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
