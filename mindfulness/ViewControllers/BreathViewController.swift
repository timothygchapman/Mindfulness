//
//  ViewController.swift
//  mindfulness
//
//  Created by Brayden Lemke on 2/27/24.
//

import UIKit

class BreathViewController: UIViewController {
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var instructionLabel: UILabel!
    
    var breathExercise: BreathExercise?
    private var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircleView()
        startBreathingExercise()
    }
    
    private func setupCircleView() {
        circleView.layer.cornerRadius = circleView.bounds.width / 2
        circleView.layer.opacity = 0.5
        circleView.backgroundColor = UIColor(red: 177/255, green: 210/255, blue: 219/255, alpha: 1)
    }
    
    private func startBreathingExercise() {
        guard let exercise = breathExercise else {
            print("Breath exercise not set")
            return
        }
        
        let (inhaleTime, holdTime, exhaleTime) = getBreathingTimes(for: exercise.typeOfBreathExercise)
        let totalCycleDuration = Double(inhaleTime + holdTime + exhaleTime)
        let numberOfCycles = exercise.exerciseDuration.rawValue
        
        animateBreathing(inhaleTime: inhaleTime, holdTime: holdTime, exhaleTime: exhaleTime, totalCycles: numberOfCycles)
        updateInstructions(inhaleTime: inhaleTime, holdTime: holdTime, exhaleTime: exhaleTime, totalCycles: numberOfCycles)
    }
    
    private func getBreathingTimes(for exerciseType: BreathExercise.TypeOfBreathExercise) -> (inhale: Double, hold: Double, exhale: Double) {
        switch exerciseType {
        case .box:
            return (4, 4, 4)
        case .resonance:
            return (4, 2, 4)
        case .fourSevenEight:
            return (4, 7, 8)
        }
    }
    
    private func animateBreathing(inhaleTime: Double, holdTime: Double, exhaleTime: Double, totalCycles: Int) {
        let totalDuration = Double(totalCycles) * (inhaleTime + holdTime + exhaleTime)
        
        animator?.stopAnimation(true)
        animator = UIViewPropertyAnimator(duration: totalDuration, curve: .linear) { [weak self] in
            guard let self = self else { return }
            
            UIView.animateKeyframes(withDuration: totalDuration, delay: 0, options: [.repeat, .calculationModeLinear]) {
                let cycleDuration = inhaleTime + holdTime + exhaleTime
                let cycleRelativeDuration = cycleDuration / totalDuration
                
                for cycle in 0..<totalCycles {
                    let cycleStartTime = Double(cycle) * cycleRelativeDuration
                    
                    // Inhale
                    UIView.addKeyframe(withRelativeStartTime: cycleStartTime, relativeDuration: inhaleTime / totalDuration) {
                        self.circleView.transform = CGAffineTransform(scaleX: 2, y: 2)
                        self.circleView.backgroundColor = UIColor(red: 0/255, green: 109/255, blue: 176/255, alpha: 1)
                        self.circleView.layer.opacity = 1
                    }
                    
                    // Hold
                    UIView.addKeyframe(withRelativeStartTime: cycleStartTime + (inhaleTime / totalDuration), relativeDuration: holdTime / totalDuration) {
                        self.circleView.transform = CGAffineTransform(scaleX: 2, y: 2).rotated(by: .pi / 4)
                    }
                    
                    // Exhale
                    UIView.addKeyframe(withRelativeStartTime: cycleStartTime + ((inhaleTime + holdTime) / totalDuration), relativeDuration: exhaleTime / totalDuration) {
                        self.circleView.transform = .identity
                        self.circleView.backgroundColor = UIColor(red: 177/255, green: 210/255, blue: 219/255, alpha: 1)
                        self.circleView.layer.opacity = 0.5
                    }
                }
            }
        }
        
        animator?.startAnimation()
    }
    
    private func updateInstructions(inhaleTime: Double, holdTime: Double, exhaleTime: Double, totalCycles: Int) {
        Task {
            for _ in 1...totalCycles {
                instructionLabel.text = "Breathe In"
                try? await Task.sleep(nanoseconds: UInt64(inhaleTime * 1_000_000_000))
                
                instructionLabel.text = "Hold"
                try? await Task.sleep(nanoseconds: UInt64(holdTime * 1_000_000_000))
                
                instructionLabel.text = "Breathe Out"
                try? await Task.sleep(nanoseconds: UInt64(exhaleTime * 1_000_000_000))
            }
            
            instructionLabel.text = "Exercise Complete"
        }
    }
}
