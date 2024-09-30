//
//  BreathExercise.swift
//  mindfulness
//
//  Created by Cesar Fernandez on 9/17/24.
//

import Foundation
import UIKit

struct BreathExercise: Codable {
    var typeOfBreathExercise: TypeOfBreathExercise
    var exerciseDuration: ExerciseDuration
    var timeStamp: Date
    
    
    init(typeOfBreathExercise: TypeOfBreathExercise, exerciseDuration: ExerciseDuration, timeStamp: Date) {
        self.typeOfBreathExercise = typeOfBreathExercise
        self.exerciseDuration = exerciseDuration
        self.timeStamp = timeStamp
    }
}

extension BreathExercise {
    enum TypeOfBreathExercise: Int, Codable {
        case box = 16
        case resonance = 10
        case fourSevenEight = 19
    }
    
    enum ExerciseDuration: Int, Codable {
        case beginner = 4
        case intermediate = 6
        case advanced = 8
    }
    
//    mutating func setBreathingInterval(_ breathIntervals: BreathIntervals) {
//        switch breathIntervals {
//        case .box:
//            breathIntervalSeconds = 16
//        case .resonance:
//            breathIntervalSeconds = 10
//        case .fourSevenEight:
//            breathIntervalSeconds = 19
//        }
//    }
//    
//    mutating func setExerciseDuration(_ exerciseDuration: ExerciseDuration) {
//        switch exerciseDuration {
//        case .beginner:
//            numberOfCycles = 4
//        case .intermediate:
//            numberOfCycles = 6
//        case .advanced:
//            numberOfCycles = 8
//        }
//    }
    
//    func getDurationSeconds() -> Int {
//       return breathIntervalSeconds * numberOfCycles
//    }
}
