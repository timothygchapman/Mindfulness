//
//  SampleData.swift
//  mindfulness
//
//  Created by Cesar Fernandez on 9/24/24.
//

import Foundation

class SampleData {
    
    var sampleHistory: [History] {
        return [
            .checkIn(CheckIn(
                journalEntry: "Good day today",
                selectedMood: CheckIn.MoodEmoji.happy
            )),
            .breathExercise(BreathExercise(
                breathIntervals: .box,
                numberOfCycles: .intermediate,
                timeStamp: Date()
            )),
            .checkIn(CheckIn(
                journalEntry: "A little tired and frustrated",
                selectedMood: CheckIn.MoodEmoji.anxious
            )),
            .breathExercise(BreathExercise(
                breathIntervals: .fourSevenEight,
                numberOfCycles: .advanced,
                timeStamp: Date()
            )),
            .checkIn(CheckIn(
                journalEntry: "Feeling alright",
                selectedMood: .relaxed
            )),
            .breathExercise(BreathExercise(
                breathIntervals: .resonance,
                numberOfCycles: .intermediate,
                timeStamp: Date()
            ))
                     
        ]
    }
    
    
}
