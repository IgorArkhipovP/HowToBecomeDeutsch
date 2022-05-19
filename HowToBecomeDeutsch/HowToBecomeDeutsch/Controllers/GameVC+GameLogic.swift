//
//  GameVC+GameLogic.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 19.05.2022.
//

import UIKit

extension GameVC {
    
    func gameLogic(){
        showQuestion()
    }
    
    private func showQuestion() {
        
        if index >= questions.count {
            endOfTheGame()
            return
        }
        
        let question = questions[index]
        
        questionLabel.text = question.questionTitle
        
        for i in answerOptionArray.indices {
            answerOptionArray[i].setTitle(question.answerOptions[i], for: .normal)
            answerOptionArray[i].addTarget(self, action: #selector(didTapButtonAnswer(sender:)), for: .touchUpInside)
        }
    }
    
    @objc func didTapButtonAnswer(sender: HTBDButton){
        if isGameOver {
            return
        }
        
        let question = questions[index]
        
        if let titleButtonLabel = sender.titleLabel?.text, titleButtonLabel == question.correctAnswer  {
            index += 1
            victoryPoint += 1
            // sender.backgroundColor = .systemGreen
            DispatchQueue.main.asyncAfter(deadline: .now() ) {
                self.showQuestion()
                self.showACCorrectAnswerButtonTapped()
            }
        } else {
            isGameOver = true
            // sender.backgroundColor = .systemRed
            DispatchQueue.main.asyncAfter(deadline: .now() ) { self.endOfTheGame() }
        }
    }
    
    private func showACCorrectAnswerButtonTapped(){
        let acCorrectAnswerButtonTapped = UIAlertController(title: "You are right", message: "Congratulations🥳, you are so smart!", preferredStyle: .alert)
        acCorrectAnswerButtonTapped.addAction(UIAlertAction(title: "Ok", style: .default))
        present(acCorrectAnswerButtonTapped, animated: true)
    }
    
    private func endOfTheGame(){
        
        if victoryPoint == totalVictoryPoints {
            let victoryAC = UIAlertController(title: "You have won!", message: "You are the smartest person I have ever met 🥰", preferredStyle: .alert)
            victoryAC.addAction(UIAlertAction(title: "Ok", style: .default))
            present(victoryAC, animated: true)
        } else {
            let gameLoss = UIAlertController(title: "The end of the game", message: "You have lost! You could be smarter! 😱", preferredStyle: .alert)
            gameLoss.addAction(UIAlertAction(title: "Ok", style: .default))
            present(gameLoss, animated: true)
        }
    }
}
