//
//  GameVC.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 18.05.2022.
//

import UIKit

protocol GameVCDelegate: AnyObject {
    func didEndGame(with result: Int)
}

class GameVC: UIViewController {
    
    var index: Int = 0
    var questionLabel = HTBDLabel()
    var currentResultLabel = HTBDLabel()
    var presentageOfRightAnswersLabel = HTBDLabel()
    var questions: [Question]
    var isGameOver: Bool = false
    var totalVictoryPoints = 0
    var victoryPoint = Observable<Int>(0)
    var sequence: Sequence = .consistently
    let sequenceStrategy: SequenceStrategy
    var scrollView = UIScrollView()
    
    weak var gameDelegate: GameVCDelegate?
    
    var answerOptionArray = [
        HTBDButton(),
        HTBDButton(),
        HTBDButton(),
        HTBDButton()
    ]
    
    init(sequenceStrategy: SequenceStrategy ) {
        self.sequenceStrategy = sequenceStrategy
        questions = sequenceStrategy.getQuestion()
        totalVictoryPoints = sequenceStrategy.getQuestion().count
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesignGameVC()
        gameLogic()
        
        victoryPoint.addObserver(self, options: [.new, .initial]) { [weak self] (victoryPoint, _) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            self?.currentResultLabel.text = "Your current result is \(victoryPoint) from 7 points."
            }
        }
    }
}
