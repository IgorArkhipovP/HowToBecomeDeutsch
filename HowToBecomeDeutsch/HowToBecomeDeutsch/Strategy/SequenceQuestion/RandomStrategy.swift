//
//  RandomStrategy.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 24.05.2022.
//

import Foundation

class RandomStrategy: SequenceStrategy {
    func getQuestion() -> [Question] {
        var questions = fillOutQuestionArray()
  
        questions.shuffle()
        
        return questions
    }
}
