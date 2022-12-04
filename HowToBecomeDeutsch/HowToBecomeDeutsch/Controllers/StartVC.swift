//
//  StartVC.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 18.05.2022.
//

import UIKit

class StartVC: UIViewController {
    
    private let startGameButton = HTBDButton(backgroundColor: .systemCyan, title: "Start a new game")
    private let recordsButton = HTBDButton(backgroundColor: .systemOrange, title: "Records")
    private let titleLabel = HTBDLabel(text: "Welcome to the game - How to become Deutsch")
    private let lastResultLabel = HTBDLabel()
    private var sequenceSegmentedControl = UISegmentedControl(items: ["Consistent order ", "Random order"])
    private var createNewQuestionButton = HTBDButton(backgroundColor: .systemMint, title: "Create a new question")
    private var scrollView = UIScrollView()
    var selectedSequence: Sequence {
        switch sequenceSegmentedControl.selectedSegmentIndex {
        case 0:
            return .consistently
        case 1:
            return .randomly
        default:
            return .consistently
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureScrollView()
        configureTitleLabel()
        configureStartGameButton()
        configureRecordsButton()
        configureNewQuestionButton()
        configureLastResultLabel()
        configureDifficultySegmentedControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    private func configureTitleLabel(){
        scrollView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50)
        ])
    }
    
    private func configureStartGameButton() {
        scrollView.addSubview(startGameButton)
        startGameButton.addTarget(self, action: #selector(presentGameVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startGameButton.heightAnchor.constraint(equalToConstant: 50),
            startGameButton.widthAnchor.constraint(equalToConstant: 230),
            startGameButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            startGameButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 330)
        ])
    }
    
    private func configureRecordsButton(){
        scrollView.addSubview(recordsButton)
        recordsButton.addTarget(self, action: #selector(pushRecordsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            recordsButton.heightAnchor.constraint(equalToConstant: 50),
            recordsButton.widthAnchor.constraint(equalToConstant: 230),
            recordsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            recordsButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 20)
        ])
    }
    
    private func configureNewQuestionButton(){
        scrollView.addSubview(createNewQuestionButton)
        createNewQuestionButton.addTarget(self, action: #selector(pushSetUpNewQuestionVC), for: .touchUpInside)
        
        createNewQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createNewQuestionButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            createNewQuestionButton.widthAnchor.constraint(equalToConstant: 230),
            createNewQuestionButton.heightAnchor.constraint(equalToConstant: 50),
            createNewQuestionButton.topAnchor.constraint(equalTo: recordsButton.bottomAnchor, constant: 20)
        ])
    }
    
    private func configureLastResultLabel() {
        scrollView.addSubview(lastResultLabel)
        
        lastResultLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lastResultLabel.text = "You have not played yet"
        
        NSLayoutConstraint.activate([
            lastResultLabel.heightAnchor.constraint(equalToConstant: 50),
            lastResultLabel.widthAnchor.constraint(equalToConstant: 250),
            lastResultLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lastResultLabel.topAnchor.constraint(equalTo: createNewQuestionButton.bottomAnchor, constant: 50)
        ])
    }
    
    private func configureDifficultySegmentedControl() {
        scrollView.addSubview(sequenceSegmentedControl)
        sequenceSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sequenceSegmentedControl.heightAnchor.constraint(equalToConstant: 50),
            sequenceSegmentedControl.widthAnchor.constraint(equalToConstant: 300),
            sequenceSegmentedControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            sequenceSegmentedControl.topAnchor.constraint(equalTo: lastResultLabel.bottomAnchor, constant: 30)
        ])
    }
    
    @objc
    private func presentGameVC(){
        
        var chooseSequence: SequenceStrategy
        
        switch selectedSequence {
        case .consistently:
            chooseSequence = ConsistenceStrategy()
        case .randomly:
            chooseSequence = RandomStrategy()
        }
        
        let destVC = GameVC(sequenceStrategy: chooseSequence)
        destVC.gameDelegate = self
        destVC.sequence = selectedSequence
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    @objc
    private func pushRecordsVC() {
        navigationController?.pushViewController(RecordsVC(), animated: true)
    }
    
    @objc
    private func pushSetUpNewQuestionVC(){
        navigationController?.pushViewController(SetUpNewQuestionVC(), animated: true)
    }
}

extension StartVC: GameVCDelegate {
    func didEndGame(with result: Int) {
        lastResultLabel.text = "Last result is \(result)"
    }
    
}
