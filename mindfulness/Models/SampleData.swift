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
                typeOfBreathExercise: .box,
                exerciseDuration: .intermediate,
                timeStamp: Date()
            )),
            .checkIn(CheckIn(
                journalEntry: "A little tired and frustrated",
                selectedMood: CheckIn.MoodEmoji.anxious
            )),
            .breathExercise(BreathExercise(
                typeOfBreathExercise: .fourSevenEight,
                exerciseDuration: .advanced,
                timeStamp: Date()
            )),
            .checkIn(CheckIn(
                journalEntry: "Feeling alright",
                selectedMood: .relaxed
            )),
            .breathExercise(BreathExercise(
                typeOfBreathExercise: .resonance,
                exerciseDuration: .intermediate,
                timeStamp: Date()
            ))
                     
        ]
    }
    
    
}
