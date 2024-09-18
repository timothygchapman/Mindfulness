//
//  BreathExercise.swift
//  mindfulness
//
//  Created by Cesar Fernandez on 9/17/24.
//

import Foundation
import UIKit

struct BreathExercise {
    var breathIntervalSeconds: Int
    var durationSeconds: Int
    var timeStamp: Date
}

extension BreathExercise {
    enum BreathIntervals {
        case box
        case resonance
        case fourSevenEight
    }
    
    enum ExerciseDuration {
        case beginner
        case intermediate
        case advanced
    }
    
    mutating func setBreathingInterval(_ breathIntervals: BreathIntervals) {
        switch breathIntervals {
        case .box:
            breathIntervalSeconds = 16
        case .resonance:
            breathIntervalSeconds = 10
        case .fourSevenEight:
            breathIntervalSeconds = 19
        }
    }
    
    mutating func setExerciseDuration(_ exerciseDuration: ExerciseDuration) {
        switch exerciseDuration {
        case .beginner:
            durationSeconds = 4
        case .intermediate:
            durationSeconds = 6
        case .advanced:
            durationSeconds = 8
        }
    }
    
    func getBreathExercise() -> Int {
       return breathIntervalSeconds * durationSeconds
    }
    
}
