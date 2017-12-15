//
//  File.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 15-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Score {
    let user: String
    let score: Int
    
    init(snapshot: DataSnapshot) {
        user = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        score = snapshotValue["score"] as! Int
    }
}
