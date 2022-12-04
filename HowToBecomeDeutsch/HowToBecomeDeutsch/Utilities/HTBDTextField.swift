//
//  HTBDTextField.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 26.05.2022.
//

import UIKit

class HTBDTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textPlaceholer: String){
        self.init(frame: .zero)
        self.placeholder = textPlaceholer
    }
    
    private func configureTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 15
        layer.borderWidth = 3
        layer.borderColor = UIColor.systemIndigo.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 10
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        //MARK: A format of keyboard keyboardType = .decimalPad
        returnKeyType = .go
        clearButtonMode = .whileEditing
        placeholder = "Enter an answer"
        
    }
}
