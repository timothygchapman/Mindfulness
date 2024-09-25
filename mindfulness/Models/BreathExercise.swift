//
//  BreathExercise.swift
//  mindfulness
//
//  Created by Cesar Fernandez on 9/17/24.
//

import Foundation
import UIKit

struct BreathExercise: Codable {
    var breathIntervalSeconds: Int
    var numberOfCycles: Int
    var timeStamp: Date
    
    init(breathIntervals: BreathIntervals, numberOfCycles: ExerciseDuration, timeStamp: Date) {
        self.breathIntervalSeconds = breathIntervals.rawValue
        self.numberOfCycles = numberOfCycles.rawValue
        self.timeStamp = timeStamp
    }
}

extension BreathExercise {
    enum BreathIntervals: Int {
        case box = 16
        case resonance = 10
        case fourSevenEight = 19
    }
    
    enum ExerciseDuration: Int {
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
    
    func getDurationSeconds() -> Int {
       return breathIntervalSeconds * numberOfCycles
    }
    
}
