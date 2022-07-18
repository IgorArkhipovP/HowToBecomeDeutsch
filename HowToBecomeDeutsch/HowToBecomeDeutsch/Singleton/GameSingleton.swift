//
//  GameSingleton.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 20.05.2022.
//

import Foundation

class GameSingleton {
    
    static let shared = GameSingleton()
    private let recordCaretaker = RecordsCaretaker()
    private(set) var records: [Record] = [] {
        didSet {
            recordCaretaker.saveRecords(records: records)
        }
    }
    
    private init() { records = recordCaretaker.loadRecords() ?? [] }
    
    func addRecord(record: Record){
        records.append(record)
    }
    
    func clearRecords(){
        records.removeAll()
    }
    
    
}
