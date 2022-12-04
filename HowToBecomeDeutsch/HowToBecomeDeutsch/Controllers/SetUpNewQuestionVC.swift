//
//  SetUpNewQuestionVC.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 26.05.2022.
//

import UIKit

enum QuestionFieldsTag: Int {
    case questionTitle = -1
    case firstAnswer
    case secondAnswer
    case thirdAnswer
    case fourthAnswer
}

class SetUpNewQuestionVC: UIViewController {
    
    private let scrollView = UIScrollView()
    private var questionTF = HTBDTextField(textPlaceholer: "Enter a new question") 
////        didSet{
////            questionTF.tag = QuestionFieldsTag.questionTitle.rawValue
////        }
//    }
    private var answerTFOne = HTBDTextField()
    private var answerTFTwo = HTBDTextField()
    private var answerTFThree = HTBDTextField()
    private var answerTFFour = HTBDTextField()
    private let chooseRightAnswerLabel = HTBDLabel()
    private var correctAnswerSegmentedControl = UISegmentedControl(items: ["First", "Second", "Third", "Fourth"])
    private var saveButton = HTBDButton(backgroundColor: .systemYellow, title: "Save the question")
    private let constantPaddling: CGFloat = 8
    private let constantHeightAnchor: CGFloat = 55
    private let topAnchorContstraint: CGFloat = 10
    private var question = QuestionBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Create your unique question 🤪"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        configureScrollView()
        configureQuestionTF()
        configureAnswerTFOne()
        configureAnswerTFTwo()
        configureAnswerTFThree()
        configureAnswerTFFour()
        configureChooseCorrectAnswerLabel()
        configureSegmentedControl()
        configureSaveButton()
    }
    
    private func configureScrollView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 700)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureQuestionTF(){
        scrollView.addSubview(questionTF)
        
        NSLayoutConstraint.activate([
            questionTF.heightAnchor.constraint(equalToConstant: constantHeightAnchor),
            questionTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constantPaddling),
            questionTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constantPaddling),
            questionTF.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            questionTF.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50)
        ])
    }
    
    
    private func configureAnswerTFOne(){
        scrollView.addSubview(answerTFOne)
        
        NSLayoutConstraint.activate([
            answerTFOne.heightAnchor.constraint(equalToConstant: constantHeightAnchor),
            answerTFOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constantPaddling),
            answerTFOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constantPaddling),
            answerTFOne.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            answerTFOne.topAnchor.constraint(equalTo: questionTF.bottomAnchor, constant: topAnchorContstraint)
        ])
    }
    
    
    private func configureAnswerTFTwo(){
        scrollView.addSubview(answerTFTwo)
        
        NSLayoutConstraint.activate([
            answerTFTwo.heightAnchor.constraint(equalToConstant: constantHeightAnchor),
            answerTFTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constantPaddling),
            answerTFTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constantPaddling),
            answerTFTwo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            answerTFTwo.topAnchor.constraint(equalTo: answerTFOne.bottomAnchor, constant: topAnchorContstraint)
        ])
    }
    
    private func configureAnswerTFThree(){
        scrollView.addSubview(answerTFThree)
        
        NSLayoutConstraint.activate([
            answerTFThree.heightAnchor.constraint(equalToConstant: constantHeightAnchor),
            answerTFThree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constantPaddling),
            answerTFThree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constantPaddling),
            answerTFThree.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            answerTFThree.topAnchor.constraint(equalTo: answerTFTwo.bottomAnchor, constant: topAnchorContstraint)
        ])
    }
    
    private func configureAnswerTFFour(){
        scrollView.addSubview(answerTFFour)
        
        NSLayoutConstraint.activate([
            answerTFFour.heightAnchor.constraint(equalToConstant: constantHeightAnchor),
            answerTFFour.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constantPaddling),
            answerTFFour.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constantPaddling),
            answerTFFour.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            answerTFFour.topAnchor.constraint(equalTo: answerTFThree.bottomAnchor, constant: topAnchorContstraint)
        ])
    }
    
    private func configureChooseCorrectAnswerLabel(){
        scrollView.addSubview(chooseRightAnswerLabel)
        
        chooseRightAnswerLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        chooseRightAnswerLabel.text = "Choose a correct answer"
        
        NSLayoutConstraint.activate([
           chooseRightAnswerLabel.heightAnchor.constraint(equalToConstant: 50),
           chooseRightAnswerLabel.widthAnchor.constraint(equalToConstant: 250),
           chooseRightAnswerLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
           chooseRightAnswerLabel.topAnchor.constraint(equalTo: answerTFFour.bottomAnchor, constant: 50)
        ])
    }
    
    private func configureSegmentedControl(){
        scrollView.addSubview(correctAnswerSegmentedControl)
        
        correctAnswerSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            correctAnswerSegmentedControl.heightAnchor.constraint(equalToConstant: 50),
            correctAnswerSegmentedControl.widthAnchor.constraint(equalToConstant: 300),
            correctAnswerSegmentedControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            correctAnswerSegmentedControl.topAnchor.constraint(equalTo: chooseRightAnswerLabel.bottomAnchor, constant: 30)
        ])
    }
    
    private func configureSaveButton(){
        scrollView.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 230),
            saveButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: correctAnswerSegmentedControl.bottomAnchor, constant: 100)
        ])
    }
    
    @objc
    private func textFieldDidChange(textField: UITextField){
        
        var text = textField.text ?? ""
        
        switch textField.tag {
        case QuestionFieldsTag.questionTitle.rawValue:
            question.setTitle(text)
        case QuestionFieldsTag.firstAnswer.rawValue:
            question.setFirstAnswer(text)
        case QuestionFieldsTag.secondAnswer.rawValue:
            question.setSecondAnswer(text)
        case QuestionFieldsTag.thirdAnswer.rawValue:
            question.setThirdAnswer(text)
        case QuestionFieldsTag.fourthAnswer.rawValue:
            question.setFourthAnswer(text)
        default:
            break
        }
    }
}
