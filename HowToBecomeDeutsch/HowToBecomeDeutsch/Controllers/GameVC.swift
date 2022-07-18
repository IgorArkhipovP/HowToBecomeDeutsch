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
    let questions: [Question] = getQuestions()
    var isGameOver: Bool = false
    let totalVictoryPoints = 7
    var victoryPoint = 0
    let scrollView = UIScrollView()
    
    weak var gameDelegate: GameVCDelegate?
    
    var answerOptionArray = [
        HTBDButton(),
        HTBDButton(),
        HTBDButton(),
        HTBDButton()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesignGameVC()
        gameLogic()
    }
}
