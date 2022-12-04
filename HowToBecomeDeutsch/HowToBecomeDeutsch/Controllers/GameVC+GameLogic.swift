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
            answerOptionArray[i].addTarget(self, action: #selector(didTapButtonAnswer(sender: )), for: .touchUpInside)
        }
    }
    
    @objc func didTapButtonAnswer(sender: HTBDButton){
       if isGameOver {
           return
       }

        let question = questions[index]
        
        if let titleButtonLabel = sender.titleLabel?.text, titleButtonLabel == question.correctAnswer  {
            index += 1
            victoryPoint.value += 1
            sender.backgroundColor = .systemYellow
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                sender.backgroundColor = .systemBackground
                self.showQuestion()
                self.showACCorrectAnswerButtonTapped()
            }
        } else {
            isGameOver = true
            sender.backgroundColor = .systemYellow
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                sender.backgroundColor = .systemBackground
                self.endOfTheGame()
            }
        }
    }
    
    private func showACCorrectAnswerButtonTapped(){
        let acCorrectAnswerButtonTapped = UIAlertController(title: "YOU ARE RIGHT!😇", message: "Congratulations🥳, you are so smart!", preferredStyle: .alert)
        acCorrectAnswerButtonTapped.addAction(UIAlertAction(title: "Ok", style: .default))
        present(acCorrectAnswerButtonTapped, animated: true)
    }
    
    private func endOfTheGame(){
        
        gameDelegate?.didEndGame(with: victoryPoint.value)
        
        GameSingleton.shared.addRecord(record: Record(date: Date(), score: victoryPoint.value))
        
        if victoryPoint.value == totalVictoryPoints {
            let victoryAC = UIAlertController(title: "You have won!", message: "You are the smartest person I have ever met 🥰", preferredStyle: .alert)
            victoryAC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            present(victoryAC, animated: true)
        } else {
            let gameLoss = UIAlertController(title: "YOU ARE WRONG!😡", message: "You have lost! You could be smarter! 😱", preferredStyle: .alert)
            gameLoss.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            present(gameLoss, animated: true)
        }
    }
}
