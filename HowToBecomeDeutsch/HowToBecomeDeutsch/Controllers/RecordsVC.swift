//
//  ResultVC.swift
//  HowToBecomeRich
//
//  Created by Игорь  Архипов on 18.05.2022.
//

import UIKit

class RecordsVC: UIViewController {
    
    let tableView = UITableView()
    var records: [Record] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureRecordsVC()
        configureTableView()
    }
    
    private func configureRecordsVC(){
        view.backgroundColor = .systemBackground
        title = "Records"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(RecordsTVC.self, forCellReuseIdentifier: RecordsTVC.reuseID)
    }
}

extension RecordsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameSingleton.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecordsTVC.reuseID, for: indexPath) as? RecordsTVC else { return UITableViewCell() }
        let record = GameSingleton.shared.records[indexPath.row]
        cell.recordsLabel.text = "Result is \(record.score) points, dated \(DateFormatter.localizedString(from: record.date, dateStyle: .medium, timeStyle: .short))"
        
        //MARK: A colour of a click is changed
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemGray5
        cell.selectedBackgroundView = backgroundView
        
        //MARK: Different colour of cells
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .clear
        } else {
            cell.backgroundColor = UIColor(red: 120/255.0, green: 150/255.0, blue: 200/255.0, alpha: 0.3)
        }
        return cell
    }
}
