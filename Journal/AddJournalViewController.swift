//
//  AddJournalViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/3/20.
//

import UIKit
import AVFoundation

class AddJournalViewController: UIViewController {
    @IBOutlet weak var inputLabel: UITextField!
    
    // This is to satisfy the audio through AV
    // https://developer.apple.com/documentation/avfoundation/avspeechsynthesizer
    override func viewDidLoad() {
        super.viewDidLoad()
        // https://nshipster.com/avspeechsynthesizer/
//        let speechSynthesizer = AVSpeechSynthesizer() // Object that will take in a speechUtterance object to speak
        let speechSynthesizer = AVSpeechSynthesizer()
        let speechUtterance = AVSpeechUtterance(string: "How are you feeling today?") // Speech Utterance object that had the phrase to speak
        speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 1.8 // Can adjust speed, larger division number the slower it is
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Ensure it is in US English
        // causes an warning
        speechSynthesizer.speak(speechUtterance) // pass object to execute speech
//        dismiss(animated: true, completion: nil) // transition into next screen

        // Do any additional setup after loading the view.
    }
    
    func checkFields() -> Bool {
        if inputLabel.text == "" {
            let alert = UIAlertController(title: "Invalid Entry",
                                            message: "Cannot submit empty mood",
                                            preferredStyle: .alert)
            let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func handleSubmit(_ sender: Any) {
        if checkFields() {
            let contents = inputLabel.text
            addMood(contents)
            close()
        }
    }
    
    // The ? is to unwrap the argument and see if its a string, we do not wawnt to force it in case the value is nil
    func addMood(_ mood:String?) {
        let newMood = MoodItem();

        let date = Date()
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM-dd-YYYY"
        let formattedDate = inputFormatter.string(from: date)

        newMood.date = formattedDate
        newMood.mood = mood!
        
        // update array
        var allMoods = PersistencyHelper.loadMoodItems()
        
        var exists = false
        var index = 0;
        
        // check if todays date already had a mood, then need to edit it
        for amood in allMoods {
            if amood.date == formattedDate {
                exists = true
                break
            }
            index+=1
        }
        
        if exists {
            allMoods[index] = newMood
        } else {
            allMoods.append(newMood)
        }
        
        // sort for all moods table
        allMoods.sort{$0.date > $1.date}
        
        // update file
        PersistencyHelper.saveMoods(allMoods)
    }
    /*
     Notes:
     1. Update the today modd if already exists if not add it to the
        dictionary of moods and dates
     */
    
    // MARK:- Cancel
    // cancel the entry if needed
    @IBAction func close() {
        inputLabel.text = ""
        dismiss(animated:true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
