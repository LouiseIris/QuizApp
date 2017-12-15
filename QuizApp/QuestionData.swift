//
//  QuestionData.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 07-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import Foundation

struct Question: Codable {
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}

struct Questions: Codable {
    let results: [Question]
}
