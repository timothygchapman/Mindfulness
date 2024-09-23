//
//  DataStoreController.swift
//  mindfulness
//
//  Created by Cesar Fernandez on 9/20/24.
//

import Foundation


class DataStoreController {
    static let shared = DataStoreController()
    static let dataStore = DataStore()
    let defaults = UserDefaults.standard
    var checkInArray: [CheckIn] = []
    var breathExerciseArray: [BreathExercise] = []
    var checkInArrayKey = "checkInArray"
    var breathExerciseKey = "breathExercise"
    
    //    func getWellnessLog() -> [WellnessLog]? {
    //        
    //    }
}
