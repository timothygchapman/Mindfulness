//
//  CheckInObject.swift
//  mindfulness
//
//  Created by Thomas Mullins on 9/17/24.
//

import Foundation

// Enum to represent different mood emojis
enum MoodEmoji: String, CaseIterable {
    case happy = "😊"
    case sad = "😢"
    case angry = "😠"
    case neutral = "😐"
    case anxious = "😰"
    case relaxed = "😌"
}

struct CheckIn {
    let id: String
    let timeStamp: Date
    let journalEntry: String
    let selectedMood: MoodEmoji
    
    init(journalEntry: String, selectedMood: MoodEmoji) {
        self.id = UUID().uuidString
        self.timeStamp = Date()
        self.journalEntry = journalEntry
        self.selectedMood = selectedMood
    }
}
