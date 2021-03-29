//
//  StartView.swift
//  SimonSays
//
//  Created by Shihchiao Chao on 3/28/21.
//

import UIKit

protocol stateViewControllerDelegate: class {
    func didStart()
}

class StateViewController: UIViewController {
    
    fileprivate var timerCounter = 4 {
        didSet {
            if timerCounter == 0 {
                gameStartTimer.invalidate()
                gameStart()
                return
            }
            
            startButton.setTitle("\(timerCounter)", for: .normal)
        }
    }
    
    weak var stateVCDelegate: stateViewControllerDelegate?
    fileprivate var gameStartTimer = Timer()
    
    fileprivate let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.init(name: Font.Arcade, size: 20)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = .white
        return button
    }()
    
    init(isGameOver: Bool) {
        let title = isGameOver ? GameState.GameOver.rawValue : GameState.Start.rawValue
        startButton.setTitle(title, for: .normal)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        layoutViews()
        addTarget()
    }
    
    fileprivate func gameStart() {
        dismiss(animated: true) {
            self.stateVCDelegate?.didStart()
        }
    }
    
    fileprivate func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
    fileprivate func layoutViews() {
        view.addSubview(startButton)
        
        _ = startButton.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: 100))
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func addTarget() {
        startButton.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
    }
    
    @objc fileprivate func handleStart(button: UIButton) {
        gameStartTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            guard let self = self else { return }
            
            self.timerCounter -= 1
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
