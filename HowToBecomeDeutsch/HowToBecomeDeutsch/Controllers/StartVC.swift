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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureStartGameButton()
        configureRecordsButton()
        configureLastResultLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    private func configureTitleLabel(){
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
    }
    
    private func configureStartGameButton() {
        view.addSubview(startGameButton)
        startGameButton.addTarget(self, action: #selector(presentGameVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startGameButton.heightAnchor.constraint(equalToConstant: 50),
            startGameButton.widthAnchor.constraint(equalToConstant: 200),
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 330)
        ])
    }
    
    private func configureRecordsButton(){
        view.addSubview(recordsButton)
        recordsButton.addTarget(self, action: #selector(pushRecordsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            recordsButton.heightAnchor.constraint(equalToConstant: 50),
            recordsButton.widthAnchor.constraint(equalToConstant: 200),
            recordsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordsButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 20)
        ])
    }
    
    private func configureLastResultLabel() {
        view.addSubview(lastResultLabel)
        
        lastResultLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lastResultLabel.text = "You have not played yet"
        
        NSLayoutConstraint.activate([
            lastResultLabel.heightAnchor.constraint(equalToConstant: 50),
            lastResultLabel.widthAnchor.constraint(equalToConstant: 250),
            lastResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastResultLabel.topAnchor.constraint(equalTo: recordsButton.bottomAnchor, constant: 50)
        ])
    }
    
    @objc
    private func presentGameVC(){
        let destVC = GameVC()
        destVC.gameDelegate = self
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    @objc
    private func pushRecordsVC() {
        navigationController?.pushViewController(RecordsVC(), animated: true)
    }
}

extension StartVC: GameVCDelegate {
    func didEndGame(with result: Int) {
        lastResultLabel.text = "Last result is \(result)"
    }
    
}
