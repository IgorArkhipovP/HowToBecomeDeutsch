//
//  QuestionModel.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 19.05.2022.
//

import Foundation

struct Question {
    let questionTitle: String
    let answerOptions: [String]
    let correctAnswer: String
}

func getQuestions() -> [Question] {
    var questions: [Question] = []
    
    questions.append(Question(questionTitle: "Übersetzen Sie bitte das englischen Wort (Eye)",
                              answerOptions: ["Das Auge",
                                              "Die Nase",
                                              "Der Zahn",
                                              "Der Bauch"],
                              correctAnswer: "Das Auge"))
    
    questions.append(Question(questionTitle: "Übersetzen Sie bitte das englischen Wort (Ear)",
                              answerOptions: ["Der Mund",
                                              "Das Haar",
                                              "Die Brust",
                                              "Das Ohr"],
                              correctAnswer: "Das Ohr"))
    
    questions.append(Question(questionTitle: "Übersetzen Sie bitte das englischen Wort (Neck)",
                              answerOptions: ["Der Arm",
                                              "Das Haar",
                                              "Die Schulter",
                                              "Der Hals"],
                              correctAnswer: "Der Hals"))
    
    questions.append(Question(questionTitle: "Übersetzen Sie bitte das englischen Wort (Elbow)",
                              answerOptions: ["Der Ellenbogen",
                                              "Das Ause",
                                              "Das Haar",
                                              "Der Fuß"],
                              correctAnswer: "Der Ellenbogen"))
    
    questions.append(Question(questionTitle: "Übersetzen Sie bitte das englischen Wort (Head)",
                              answerOptions: ["Der Bauch",
                                              "Das Knie",
                                              "Die Nase",
                                              "Der Kopf"],
                              correctAnswer: "Der Kopf"))
    
    questions.append(Question(questionTitle: "Übersetzen Sie bitte das englischen Wort (Face)",
                              answerOptions: ["Der Gesicht",
                                              "Der Mund",
                                              "Der Bauch",
                                              "Der Rücken"],
                              correctAnswer: "Der Gesicht"))
    
    questions.append(Question(questionTitle: "Übersetzen Sie bitte das englischen Wort (Leg)",
                              answerOptions: ["Der Zahn",
                                              "Das Bein",
                                              "Die Schulter",
                                              "Der Kopf"],
                              correctAnswer: "Das Bein"))
    
    return questions
}


