//
//  ViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/2/20.
//

import UIKit
import AVFoundation

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
    
    @IBAction func handleSignIn () {
        if checkFields() {
            username.text = ""
            password.text = ""
            // Line 1. Create an instance of AVSpeechSynthesizer.
            let speechSynthesizer = AVSpeechSynthesizer()
            // Line 2. Create an instance of AVSpeechUtterance and pass in a String to be spoken.
            let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: "Welcome to your Journal")
            //Line 3. Specify the speech utterance rate. 1 = speaking extremely the higher the values the slower speech patterns. The default rate, AVSpeechUtteranceDefaultSpeechRate is 0.5
            speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 1.8
            // Line 4. Specify the voice. It is explicitly set to English here, but it will use the device default if not specified.
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            // Line 5. Pass in the urrerance to the synthesizer to actually speak.
            speechSynthesizer.speak(speechUtterance)
            dismiss(animated: true, completion: nil)
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

