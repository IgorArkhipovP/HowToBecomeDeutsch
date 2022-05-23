//
//  GameVC+ConfigureUI.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 19.05.2022.
//

import UIKit

extension GameVC {
    
    func configureDesignGameVC(){
        configureScreen()
        configureScrollView()
        configureQuestionTitle()
        configureAnswerOptions()
    }
    
    private func configureScreen(){
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureScrollView(){
        view.addSubview(scrollView)
    
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
    
    private func configureQuestionTitle(){
        scrollView.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.heightAnchor.constraint(equalToConstant: 100),
            questionLabel.widthAnchor.constraint(equalToConstant: 300),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        ])
    }
    
    private func configureAnswerOptions() {
      
        for answer in answerOptionArray {
            scrollView.addSubview(answer)
            answer.layer.borderWidth = 0.6
            answer.layer.borderColor = UIColor.lightGray.cgColor
            answer.setTitleColor(.systemBlue, for: .normal)
            answer.backgroundColor = .systemBackground
            
            NSLayoutConstraint.activate([
                answer.heightAnchor.constraint(equalToConstant: 60),
                answer.widthAnchor.constraint(equalToConstant: 350),
                answer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            answerOptionArray[0].topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            answerOptionArray[1].topAnchor.constraint(equalTo: answerOptionArray[0].bottomAnchor, constant: 15),
            answerOptionArray[2].topAnchor.constraint(equalTo: answerOptionArray[1].bottomAnchor, constant: 15),
            answerOptionArray[3].topAnchor.constraint(equalTo: answerOptionArray[2].bottomAnchor, constant: 15),
        ])
    }
}
