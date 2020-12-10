//
//  ViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/2/20.
//

import UIKit
//import AVFoundation

class ViewController: UIViewController {
    // IBOutlets that let you bind objects with the interface builder
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // have the sign in button pulsate to encourage login
        // this is for the animation, refer to function for more info
        pulseButtonPressed(myButton)
    }
    
    //MARK:- Animation
    @IBAction func pulseButtonPressed(_ sender: UIButton) {
        // Use our extension function we used to add the effect of pulsation
        // refer to UIButton.swift
        sender.pulsate(myButton)
    }
    
    // MARK:- Authentication
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
    
    // alert user doesn't exist
    func showAlert () {
        let alert = UIAlertController(title: "Invalid User",
                                      message: "User Doesn't Exist",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // This is to satisfy the audio through AV
    // https://developer.apple.com/documentation/avfoundation/avspeechsynthesizer
    @IBAction func handleSignIn () {
        if checkFields() {
            // simple session object with limited default behavior
            let session = URLSession.shared
            // provides the resource that we will be making get request to
            let url = URL(string: "https://ios-journal.herokuapp.com/api/user/login")!
            
            // make it post request to pass data as parameters
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // set dictionary with contents we will pass
            let json = [
                "username": username.text,
                "password": password.text
            ]
            
            // convert to json
            let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            // set up closure to execute functions and store its results
            let task = session.uploadTask(with: request, from: jsonData) {data, response, error in
                if let httpResponse = response as? HTTPURLResponse,
                   (200...299).contains(httpResponse.statusCode) {
                    DispatchQueue.main.async {
                        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JournalViewController") as? UINavigationController {
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true, completion: nil)
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.showAlert()
                    }
                    return
                }
            }
            task.resume() // executing request
            
            // https://stackoverflow.com/questions/39929592/how-to-push-and-present-to-uiviewcontroller-programmatically-without-segue-in-io
            
            username.text = ""
            password.text = ""
        }
    }
    
    @IBAction func handleSignUp () {
        if checkFields() {
            
            // simple session object with limited default behavior
            let session = URLSession.shared
            // provides the resource that we will be making get request to
            let url = URL(string: "https://ios-journal.herokuapp.com/api/user/signup")!
            
            // make it post request to pass data as parameters
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // set dictionary with contents we will pass
            let json = [
                "username": username.text,
                "password": password.text
            ]
            
            // convert to json
            let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            // set up closure to execute functions and store its results
            let task = session.uploadTask(with: request, from: jsonData) {data, response, error in
                if let httpResponse = response as? HTTPURLResponse,
                   (200...299).contains(httpResponse.statusCode) {
                    DispatchQueue.main.async {
                        self.handleSignIn()
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.username.text = "";
                        self.password.text = "";
                        let alert = UIAlertController(title: "Invalid Entry",
                                                      message: "User Already Exists",
                                                      preferredStyle: .alert)
                        let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
                        
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }
                    return
                }
            }
            task.resume() // executing request
            
        }
    }
}

