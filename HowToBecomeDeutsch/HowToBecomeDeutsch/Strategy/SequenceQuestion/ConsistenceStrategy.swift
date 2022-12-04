//
//  ConsistentlyStrategy.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 24.05.2022.
//

import Foundation

class ConsistenceStrategy: SequenceStrategy {
    func getQuestion() -> [Question] {
        let questions = fillOutQuestionArray()
        return questions
    }
    
    
}
