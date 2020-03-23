//
//  ViewController.swift
//  RecipeTrackerv2
//
//  Created by TJ Foster on 2020-03-14.
//  Copyright © 2020 TJ Foster. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var loginToggle: UISegmentedControl!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var isLogin:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func loginToggleTapped(_ sender: UISegmentedControl) {
        
        // flip login boolean
        isLogin = !isLogin
        
        if isLogin {
            loginLabel.text = "Login"
            loginButton.setTitle("Login", for: .normal)
        }
        else {
            loginLabel.text = "Register"
            loginButton.setTitle("Register", for: .normal)
        }
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Form validation for email & password
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            if isLogin{
                // Login user with firebase
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    
                    if user != nil {
                        // User is found, go to next screen
                        self.performSegue(withIdentifier: "showMain", sender: self)
                    }
                    else {
                        // Error: check error and show message
                        
                    }
                
                })
            }
            else {
                // Register user with firebase
                Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                    
                    if user != nil {
                        // User is found, go to next screen
                        self.performSegue(withIdentifier: "showMain", sender: self)
                    }
                    else {
                        // Error: check error and show message
                        
                    }
                    
                })
            }
        }
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }
    
}

