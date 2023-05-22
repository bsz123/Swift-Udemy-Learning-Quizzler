//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if (quizBrain.checkAnswer(sender.currentTitle!)){
            print("Correct")
            sender.backgroundColor = UIColor.green
        }
        else{
            print("Wrong")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    

    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }

}

