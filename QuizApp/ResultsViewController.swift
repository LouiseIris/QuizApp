//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 15-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var points: Int!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = "You've earned \(points!) points"
        
        ref = Database.database().reference().child("Scores")
        saveScore()

    }
    
    func saveScore() {
        var userEmail = (Auth.auth().currentUser?.email)!
        if let shortenedUser = userEmail.range(of: "@")?.lowerBound {
            let substring = userEmail[..<shortenedUser]
            let email = String(substring)
            
            let quizScore = ["score": points as Int]
            ref.child(email).setValue(quizScore)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
