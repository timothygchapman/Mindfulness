//
//  DataStore.swift
//  mindfulness
//
//  Created by Cesar Fernandez on 9/18/24.
//

import Foundation
import UIKit

struct WellnessLog {
    var checkIn: CheckIn
    var breathExercise: BreathExercise
    
    init(checkIn: CheckIn, breathExercise: BreathExercise) {
        self.checkIn = checkIn
        self.breathExercise = breathExercise
    }
}

struct DataStore {
    let defaults = UserDefaults.standard
    var checkInArray: [CheckIn] = []
    var breathExerciseArray: [BreathExercise] = []
    var checkInArrayKey = "checkInArray"
    var breathExerciseKey = "breathExercise"
//    private var logs: [WellnessLog]
//    private var storageFileURL: URL
//    var newCheckIn: CheckIn
//    var newBreathExercise: BreathExercise
//    var newJournalEntry = ""
//    var newMoodEmoji = ""
//    var breathIntervals = 0
//    var exerciseDuration = 0
    
    
    
    
    mutating func addCheckIn(checkIn: CheckIn) {
        checkInArray.append(checkIn)
        
//        defaults.set(checkInView.text, forKey: checkInView.journalEntry)
//        defaults.set(checkInView.selectedMood, forKey: checkInView.Emojis)
        /// Rest of this logic here would look something like:
        ///  checkInView.Text = checkIn.newJournalEntry
        ///  checkinView.Emojis = checkIn.newMoodEmoji
    }
    
    mutating func addBreathExercise(breathExercise: BreathExercise) {
        breathExerciseArray.append(breathExercise)
    }
    
    /// What is the difference between between getWellnessLog & loadWellnessLog??
//    func getWellnessLog() -> [WellnessLog]? {
//        guard let retrievedWellnessLog = try?
//    }
    
    
    private func saveWellnessLog() {
        defaults.set(checkInArray, forKey: checkInArrayKey)
        defaults.set(breathExerciseArray, forKey: breathExerciseKey)
    }
    
    private mutating func loadWellnessLog() {
        checkInArray = defaults.array(forKey: checkInArrayKey) as? [CheckIn] ?? []
        breathExerciseArray = defaults.array(forKey: breathExerciseKey) as? [BreathExercise] ?? []
    }
}
