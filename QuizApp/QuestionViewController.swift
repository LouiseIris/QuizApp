//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 07-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import UIKit
import HTMLString

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    var quizQuestions: [Question]?
    var answers: [String] = []
    var questionIndex = 0
    var points = 0
    var sortedAnswers: [String] = []
    var correctAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateAnswerButtons(using: answers)
    }
    
    // when correct answer is tapped, add one point
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        switch sender {
        case answerButton1:
            if sortedAnswers[0] == correctAnswer {
                points += 1
            }
        case answerButton2:
            if sortedAnswers[1] == correctAnswer {
                points += 1
            }
        case answerButton3:
            if sortedAnswers[2] == correctAnswer {
                points += 1
            }
        case answerButton4:
            if sortedAnswers[3] == correctAnswer {
                points += 1
            }
        default:
            break
        }
        
        // emty answers and sorted answers string, then go to next question
        answers.removeAll()
        sortedAnswers.removeAll()
        nextQuestion()
    }
    
    func nextQuestion() {

        questionIndex += 1
        
        // update question, whel last question has come go to results
        if questionIndex < (self.quizQuestions?.count)! {
            updateUI()
            updateAnswerButtons(using: answers)
        } else {
            performSegue(withIdentifier: "toResults", sender: nil)
        }
    }
    
    func updateUI() {
        
        // append correct and incorrect answers to a list
        correctAnswer = self.quizQuestions![questionIndex].correct_answer.removingHTMLEntities
        questionLabel.text = self.quizQuestions![questionIndex].question.removingHTMLEntities
        answers.append(correctAnswer)
        answers.append(self.quizQuestions![questionIndex].incorrect_answers[0].removingHTMLEntities)
        answers.append(self.quizQuestions![questionIndex].incorrect_answers[1].removingHTMLEntities)
        answers.append(self.quizQuestions![questionIndex].incorrect_answers[2].removingHTMLEntities)
        print(answers)
    }
    
    
    func updateAnswerButtons(using answers: [String]) {
        
        // sort answers alphabetically
        var sorted = answers.sorted(by: <)
        for sort in sorted {
            sortedAnswers.append(sort)
        }
        
        // set answers to buttons
        answerButton1.setTitle(sortedAnswers[0], for: .normal)
        answerButton2.setTitle(sortedAnswers[1], for: .normal)
        answerButton3.setTitle(sortedAnswers[2], for: .normal)
        answerButton4.setTitle(sortedAnswers[3], for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // when segue to resulst performs, send points along with it
        if segue.identifier == "toResults" {
            let next = segue.destination as! ResultsViewController
            next.points = points
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


