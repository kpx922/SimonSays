//
//  ViewController.swift
//  SimonSays
//
//  Created by Shihchiao Chao on 3/28/21.


import UIKit

class SimonSaysViewController: UIViewController {
    fileprivate var score = 0 {
        didSet {
            updateScore(score)
        }
    }
    
    fileprivate var highScore = 0
    fileprivate var current = 0
    fileprivate var answer = [Int]()

    fileprivate var buttons = [UIButton]()
    
    fileprivate let simonSaysView: SimonSaysView = {
        return SimonSaysView()
    }()
    
    override func loadView() {
        view = simonSaysView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureView()
        addTargets()
        
        runGame()
    }
    
    fileprivate func configureNavigationBar() {
        let navBar = navigationController?.navigationBar
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.init(name: Font.Arcade, size: 20)
        ]
        
        title = Title.SimonSays
        
        navBar?.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
    }

    fileprivate func configureView() {
        view.backgroundColor = .white
        
        buttons = [
            simonSaysView.yellowButton, simonSaysView.redButton,
            simonSaysView.greenButton, simonSaysView.blueButton
        ]
        
        buttons.forEach({ $0.isUserInteractionEnabled = false })
    }
    
    fileprivate func addTargets() {
        buttons.forEach({
            $0.addTarget(self, action: #selector(handleTapOn), for: .touchUpInside)
            $0.addTarget(self, action: #selector(handleTapOn), for: .touchDown)
        })
    }
}

// MARK:- Game Process
extension SimonSaysViewController {
    fileprivate func runGame() {
        showStateView()
    }
    
    fileprivate func nextRound() {
        buttons.forEach({ $0.isUserInteractionEnabled = false })

        current = 0
        addRandomElementToAnswer()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] (_) in
            guard let self = self else { return }
            self.simonSays()
        }
    }

    fileprivate func gameOver() {
        buttons.forEach({ $0.isUserInteractionEnabled = false })

        score = 0
        current = 0
        answer = []
        
        showStateView(isGameOver: true)
    }
    
    fileprivate func addRandomElementToAnswer() {
        answer.append(Int.random(in: 1...4))
    }
    
    fileprivate func simonSays() {
        var delay: TimeInterval = 0
        
        let group = DispatchGroup()
        
        for item in answer {
            group.enter()
            
            Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { [weak self] (_) in
                guard let self = self else { return }
                self.say(item)
            }
            
            delay += 0.5
            
            Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { [weak self] (_) in
                guard let self = self else { return }
                self.say(item)
                
                group.leave()
            }
            
            delay += 0.5
        }
        
        group.notify(queue: .main) {
            self.buttons.forEach({ $0.isUserInteractionEnabled = true })
        }
    }
    
    fileprivate func say(_ item: Int) {
        switch item {
        case ButtonIndex.Yellow.rawValue:
            simonSaysView.yellowButton.glow()
            
        case ButtonIndex.Red.rawValue:
            simonSaysView.redButton.glow()

        case ButtonIndex.Green.rawValue:
            simonSaysView.greenButton.glow()

        case ButtonIndex.Blue.rawValue:
            simonSaysView.blueButton.glow()

        default:
            print("Error")
        }
    }
    
    fileprivate func updateScore(_ score: Int) {
        simonSaysView.scoreLabel.text = "\(score)"
        
        highScore = max(score, highScore)
        simonSaysView.highScoreLabel.text = "High Score: \(highScore)"
    }
    
    fileprivate func checkAnswer(_ buttonIndex: ButtonIndex) {
        if answer[current] != buttonIndex.rawValue {
            gameOver()
            return
        }

        current += 1

        if current == answer.count {
            score += 1
            nextRound()
        }
    }
    
    fileprivate func showStateView(isGameOver: Bool = false) {
        let stateViewContriller = StateViewController(isGameOver: isGameOver)
        stateViewContriller.stateVCDelegate = self
        
        stateViewContriller.modalPresentationStyle = .overFullScreen
        stateViewContriller.modalTransitionStyle = .crossDissolve
        
        present(stateViewContriller, animated: false)
    }
    
    fileprivate func tapOn(_ button: SSButton, _ buttonIndex: ButtonIndex) {
        button.glow()
        
        if !button.isSelected {
            checkAnswer(buttonIndex)
        }
    }
    
    @objc fileprivate func handleTapOn(button: UIButton) {
        switch button {
        case simonSaysView.yellowButton:
            tapOn(simonSaysView.yellowButton, .Yellow)

        case simonSaysView.redButton:
            tapOn(simonSaysView.redButton, .Red)

        case simonSaysView.greenButton:
            tapOn(simonSaysView.greenButton, .Green)

        case simonSaysView.blueButton:
            tapOn(simonSaysView.blueButton, .Blue)
            
        default:
            print("Error")
        }
    }
}

// MARK:- stateViewControllerDelegate
extension SimonSaysViewController: stateViewControllerDelegate {
    func didStart() {
        nextRound()
    }
}
