//
//  QuestionBuilder.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 26.05.2022.
//

import UIKit

class QuestionBuilder {
    private(set) var questionTitle: String = ""
    private(set) var firstAnswer: String = ""
    private(set) var secondAnswer: String = ""
    private(set) var thirdAnswer: String = ""
    private(set) var fourthAnwser: String = ""
    private(set) var correctAnswer: String = ""
    
    func build() -> Question {
        return Question(questionTitle: questionTitle,
                        answerOptions: [firstAnswer, secondAnswer, thirdAnswer, fourthAnwser],
                        correctAnswer: correctAnswer)
    }
    
    func setTitle(_ title: String) {
        self.questionTitle = title
    }
    
    func setFirstAnswer(_ answer: String) {
        self.firstAnswer = answer
    }
    
    func setSecondAnswer(_ answer: String) {
        self.secondAnswer = answer
    }
    
    func setThirdAnswer(_ answer: String) {
        self.thirdAnswer = answer
    }
    
    func setFourthAnswer(_ answer: String) {
        self.fourthAnwser = answer
    }
    
    
}
