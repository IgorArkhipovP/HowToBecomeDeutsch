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
        configureCurrentResultLabel()
        configurePresentageOfRightAnswersLabel()
    }
    
    private func configureScreen(){
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 800)
       
      NSLayoutConstraint.activate([
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
        scrollView.topAnchor.constraint(equalTo: view.topAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
      ])
    }
    
    private func configureQuestionTitle(){
        scrollView.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.heightAnchor.constraint(equalToConstant: 100),
            questionLabel.widthAnchor.constraint(equalToConstant: 300),
            questionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80)
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
                answer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            answerOptionArray[0].topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 330),
            answerOptionArray[1].topAnchor.constraint(equalTo: answerOptionArray[0].bottomAnchor, constant: 15),
            answerOptionArray[2].topAnchor.constraint(equalTo: answerOptionArray[1].bottomAnchor, constant: 15),
            answerOptionArray[3].topAnchor.constraint(equalTo: answerOptionArray[2].bottomAnchor, constant: 15),
        ])
    }
    
    private func configureCurrentResultLabel() {
       scrollView.addSubview(currentResultLabel)
        
        currentResultLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        NSLayoutConstraint.activate([
            currentResultLabel.heightAnchor.constraint(equalToConstant: 50),
            currentResultLabel.widthAnchor.constraint(equalToConstant: 250),
            currentResultLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            currentResultLabel.topAnchor.constraint(equalTo: answerOptionArray[3].bottomAnchor, constant: 50)
        ])
    }
    
    private func configurePresentageOfRightAnswersLabel() {
        scrollView.addSubview(presentageOfRightAnswersLabel)

        presentageOfRightAnswersLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        NSLayoutConstraint.activate([
            presentageOfRightAnswersLabel.heightAnchor.constraint(equalToConstant: 50),
            presentageOfRightAnswersLabel.widthAnchor.constraint(equalToConstant: 250),
            presentageOfRightAnswersLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            presentageOfRightAnswersLabel.topAnchor.constraint(equalTo: currentResultLabel.bottomAnchor, constant: 50)
        ])
        
    }
}
