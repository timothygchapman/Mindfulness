//
//  DataStore.swift
//  mindfulness
//
//  Created by Cesar Fernandez on 9/18/24.
//

import Foundation
import UIKit

enum History: Codable {
    case checkIn(CheckIn)
    case breathExercise(BreathExercise)
}

// code block is visual reference, not for functionality
//func cellForRowAtINdexPath(_ history: History) {
//    switch history {
//    case .breathExercise(let exercise):
//        // you now have an Exercise object
//        break
//    case .checkIn(let checkIn):
//        // you now have a CheckIn object
//        break
//    }
//}
//
//func addToHistory(_ checkin: CheckIn) {
//    let history = History.checkIn(checkin)
//}

class DataStore {
    static var current = DataStore()
    
    var historyArray: [History] = []
    let savingFilePath = URL.documentsDirectory.appending(path: "WellnessHistory.txt")
    
    private init() {
        loadHistory()
    }
    
    func addCheckIn(checkIn: CheckIn) {
        historyArray.append(History.checkIn(checkIn))
        saveHistory()
    }
    
    func addBreathExercise(breathExercise: BreathExercise) {
        historyArray.append(History.breathExercise(breathExercise))
        saveHistory()
    }
    
    private func saveHistory() {
        do {
            let data = try JSONEncoder().encode(historyArray)
            try data.write(to: savingFilePath)
        } catch {
            print(error)
        }
    }
    
    private func loadHistory() {
        guard let data = try? Data.init(contentsOf: savingFilePath) else { return }
        do {
            historyArray = try JSONDecoder().decode([History].self, from: data)
        } catch {
            print(error)
        }
    }
}
