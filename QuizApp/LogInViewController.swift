//
//  ViewController.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 07-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailLogInTextField: UITextField!
    @IBOutlet weak var passwordLogInTextField: UITextField!
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        
        // source: https://appcoda.com/firebase-login-signup/
        
        if self.emailLogInTextField.text == "" || self.passwordLogInTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            // sign in
            Auth.auth().signIn(withEmail: self.emailLogInTextField.text!, password: self.passwordLogInTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the StartViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "StartVC")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    // if sign in wasn't successfull print error to the console
                    print("an error")
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

