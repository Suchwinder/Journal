//
//  ViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/2/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
//    var users = [{"users":"password"}]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Helper function to ensure fields arent empty when trying to use app
    func checkFields() -> Bool {
        if username.text == "" || password.text == "" {
            let alert = UIAlertController(title: "Invalid Entry",
                                            message: "Please be sure all fields are filled",
                                            preferredStyle: .alert)
            let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func handleSignIn () {
        if checkFields() {
            username.text = ""
            password.text = ""
//            print("Contents of the username: \(username.text!)")
            
//            print("Contents of the password: \(password.text!)")
        }
    }
    @IBAction func handleSignUp () {
        if checkFields() {
            username.text = ""
            password.text = ""
//            print("Contents of the username: \(username.text!)")
            
//            print("Contents of the password: \(password.text!)")
        }
    }
}

