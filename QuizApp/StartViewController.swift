//
//  StartViewController.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 14-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var quizQuestions: [Question]?

    // When viewcontroller loaded, retrieve questions
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieve() { (questions) in
            if let questions = questions {
                self.quizQuestions = questions
            }
        }

    }
    
    // retrieve questions from API by using json decoder
    func retrieve(completion: @escaping ([Question]?) -> Void) {
        let url = URL(string: "https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let questions = try? jsonDecoder.decode(Questions.self, from: data) {
                completion(questions.results)
            } else {
                completion(nil)
            }
            
        }
        task.resume()
    }
    
    // When segue to questions performs, send questions along with it
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestions" {
            let next = segue.destination as! QuestionViewController
            next.quizQuestions = quizQuestions
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
