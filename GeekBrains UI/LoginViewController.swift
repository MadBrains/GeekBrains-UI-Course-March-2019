//
//  ViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 02/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func signIn(_ sender: Any) {
        if let login = loginTextField.text,
           let password = passwordTextField.text
        {
            if login == "admin" && password == "qwerty" {
                print("Succeess!")
            }
            else {
                print("Failure...")
            }
        }
    }
    
}

