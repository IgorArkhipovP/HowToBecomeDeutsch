//
//  HTBDLabel.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 19.05.2022.
//

import UIKit

class HTBDLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String){
        self.init(frame: .zero)
        self.text = text
    }
    
    private func configureLabel(){
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        minimumScaleFactor = 0.9
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }

}
