//
//  RecordsTVC.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 23.05.2022.
//

import UIKit

class RecordsTVC: UITableViewCell {
    
    static let reuseID = "RecordsCell"
    
    var recordsLabel = HTBDLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureRecordsCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureRecordsCell(){
        addSubview(recordsLabel)
        
        recordsLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        NSLayoutConstraint.activate([
            recordsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            recordsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            recordsLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }


}
