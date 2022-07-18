//
//  RecordsCaretaker.swift
//  HowToBecomeDeutsch
//
//  Created by Игорь  Архипов on 23.05.2022.
//

import Foundation

class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "HowToBecomeDeutsch.RecordsCaretaker.key"
    
    func saveRecords(records: [Record]){
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [Record]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
    
    
    
}
