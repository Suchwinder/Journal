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
    
    // This is to satisfy the audio through AV
    // https://developer.apple.com/documentation/avfoundation/avspeechsynthesizer
    @IBAction func handleSignIn () {
        if checkFields() {
            username.text = ""
            password.text = ""
            
//            // https://nshipster.com/avspeechsynthesizer/
//            let speechSynthesizer = AVSpeechSynthesizer() // Object that will take in a speechUtterance object to speak
//            let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: "Welcome to your Journal") // Speech Utterance object that had the phrase to speak
//            speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 1.8 // Can adjust speed, larger division number the slower it is
//            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Ensure it is in US English
//            // causes an warning
//            speechSynthesizer.speak(speechUtterance) // pass object to execute speech
//            dismiss(animated: true, completion: nil) // transition into next screen
        }
    }
    
    @IBAction func handleSignUp () {
        if checkFields() {
            username.text = ""
            password.text = ""
        }
    }
}

