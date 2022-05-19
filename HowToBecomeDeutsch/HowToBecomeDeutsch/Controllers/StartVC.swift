//
//  StartVC.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 18.05.2022.
//

import UIKit

class StartVC: UIViewController {
    
    let startGameButton = HTBDButton(backgroundColor: .systemCyan, title: "Start a new game")
    let recordsButton = HTBDButton(backgroundColor: .systemOrange, title: "Records")
    let titleLabel = HTBDLabel(text: "Welcome to the game - How to become Deutsch")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureStartGameButton()
        configureRecordsButton()
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
    
    @objc func presentGameVC(){
        navigationController?.pushViewController(GameVC(), animated: true)
    }
    
    @objc func pushRecordsVC() {
        navigationController?.pushViewController(RecordsVC(), animated: true)
    }
}
