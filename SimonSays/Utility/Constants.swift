//
//  Constants.swift
//  SimonSays
//
//  Created by Shihchiao Chao on 3/28/21.
//

import UIKit

enum ButtonIndex: Int {
    case Yellow = 1
    case Red
    case Green
    case Blue
}

enum GameState: String {
    case Start     = "Start"
    case GameOver  = "Game Over\nTap to try again!"
}

enum Title {
    static let SimonSays = "Simon Says"
}

enum Screen {
    static let screenSize = UIScreen.main.bounds.size
    static let Width      = screenSize.width
    static let Height     = screenSize.height
}

enum Font {
    static let Arcade = "Press Start 2P"
}

enum SSColor {
    static let Yellow      = UIColor.init(named: "Yellow")!
    static let LightYellow = UIColor.init(named: "LightYellow")!

    static let Red         = UIColor.init(named: "Red")!
    static let LightRed    = UIColor.init(named: "LightRed")!

    static let Green       = UIColor.init(named: "Green")!
    static let LightGreen  = UIColor.init(named: "LightGreen")!

    static let Blue        = UIColor.init(named: "Blue")!
    static let LightBlue   = UIColor.init(named: "LightBlue")!


}
