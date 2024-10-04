//
//  InitialViewController.swift
//  mindfulness
//
//  Created by Brayden Lemke on 2/28/24.
//

import UIKit

class HomeViewController: UIViewController {
    var breathExercise: BreathExercise
        
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var boxBeginnerBttn: UIButton!
    @IBOutlet weak var boxIntermediateBttn: UIButton!
    @IBOutlet weak var boxAdvancedBttn: UIButton!
    
    @IBOutlet weak var resonanceBeginnerBttn: UIButton!
    @IBOutlet weak var resonanceIntermediateBttn: UIButton!
    @IBOutlet weak var resonanceAdvacedBttn: UIButton!
    
    @IBOutlet weak var fourSevenEightBeginnerBttn: UIButton!
    @IBOutlet weak var fourSevenEightIntermediateBttn: UIButton!
    @IBOutlet weak var fourSevenEightAdvancedBttn: UIButton!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            if let quote = try? await QuoteController.getQuote() {
                quoteLabel.text = "\(quote.q)\n-\(quote.a)"
            }
        }
        setBoxBreathLevel()
        setResonanceBreathLevel()
        setFourSevenEightBreathLevel()
    }
    
    func setBoxBreathLevel() {
        if boxBeginnerBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.box
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.beginner
            
        }
        
        if boxIntermediateBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.box
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.intermediate
        }
        
        if boxAdvancedBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.box
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.advanced
        }
    }

    func setResonanceBreathLevel() {
        if resonanceBeginnerBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.resonance
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.beginner
        }
        
        if resonanceIntermediateBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.resonance
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.intermediate
        }
        
        if resonanceAdvacedBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.resonance
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.advanced
        }
        
        }
    
    func setFourSevenEightBreathLevel() {
        if fourSevenEightBeginnerBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.fourSevenEight
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.beginner
        }
        
        if fourSevenEightIntermediateBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.fourSevenEight
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.intermediate
        }
        
        if fourSevenEightAdvancedBttn.isEnabled {
            breathExercise.typeOfBreathExercise = BreathExercise.TypeOfBreathExercise.fourSevenEight
            breathExercise.exerciseDuration = BreathExercise.ExerciseDuration.advanced
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
