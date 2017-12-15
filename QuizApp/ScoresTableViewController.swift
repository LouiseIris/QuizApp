//
//  ScoresTableViewController.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 15-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ScoresTableViewController: UITableViewController {
    let ref = Database.database().reference().child("Scores")
    
    var scores: [Score] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.queryOrdered(byChild: "score").observe(.value, with: { snapshot in
            var newScores: [Score] = []
            
            for item in snapshot.children {
                let user = Score(snapshot: item as! DataSnapshot)
                newScores.append(user)
            }
            self.scores = newScores
            self.tableView.reloadData()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = scores[indexPath.row]
        
        cell.textLabel?.text = user.user
        cell.detailTextLabel?.text = String(user.score)

        return cell
    }

    
}
