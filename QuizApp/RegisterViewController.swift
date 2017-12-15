//
//  RegisterViewController.swift
//  QuizApp
//
//  Created by Iris Schlundt Bodien on 07-12-17.
//  Copyright © 2017 Iris Schlundt Bodien. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let emailField = emailTextField
        let passwordField = passwordTextField
        let confirmpasswordField = confirmPasswordTextField
        
        // source: https://appcoda.com/firebase-login-signup/
        // if password and confirmation are equal, register user and sign in
        if self.passwordTextField.text == self.confirmPasswordTextField.text {
            Auth.auth().createUser(withEmail: (emailField?.text!)!, password: (passwordField?.text!)!) { user, error in
                if error == nil {
                    Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!)
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "StartVC")
                    self.present(vc!, animated: true, completion: nil)
                }
            }

        } else {

            // tell user there's an error
            let alert = UIAlertController(title: "Confirm Password",
                                          message: "Ensure password and confirmation are equal",
                                          preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
}
