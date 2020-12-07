//
//  CalendarViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/3/20.
//

import UIKit
import FSCalendar // to use the delegate in order to interact with it

class CalendarViewController: UIViewController, FSCalendarDelegate {
    var currentMood: String!
    var currentDate: String!
    var moodsDict: [String: String] = [:]
    var moodsArr = [MoodItem]()

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var calendar: FSCalendar!
    
    func updateLabel () {
        moodLabel.text = currentMood
        dateLabel.text = currentDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentMood = "N/A"
        currentDate = "MM-dd-YYYY"
        updateLabel()
        moodsArr = PersistencyHelper.loadMoodItems()
        for moods in moodsArr {
            moodsDict[moods.date] = moods.mood
        }
        
        calendar.delegate = self // assign the delegate to self
    }
    
    // MARK:- Reset date selection
    @IBAction func todaymood(_ sender: Any) {
        currentMood="N/A"
        currentDate="MM-dd-YYYY"
        updateLabel()
    }
    
    @IBAction func allMood(_ sender: Any) {
        currentMood="N/A"
        currentDate="MM-dd-YYYY"
        updateLabel()
    }
    
    // MARK:- Calendar Functionality
    
    /*
     Function to access the dates and format it such that it can be used,
     for collecting and checking moods at a particular day
     */
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // need to do updates on each click to make sure atest version exists
        // one issue is if change made and date already selected need to
        // click off and on again
        moodsArr = PersistencyHelper.loadMoodItems()
        moodsDict.removeAll()
        
        for moods in moodsArr {
            moodsDict[moods.date] = moods.mood
        }
        // use the DateFormatter function to specify date
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM-dd-YYYY"
        let date = dateformatter.string(from: date)
        currentDate = date
        
        // check if current date has some mood stored if not then No Mood
        let keyExists = moodsDict[date] != nil
        if keyExists {
            currentMood = moodsDict[date]
        } else {
            currentMood = "No Mood"
        }
        // update all labels so user can see their moods if it exists
        updateLabel()
    }
    
    // MARK:- Sign Out
    // Currently closes screen, fast way to have user "log out"
    @IBAction func signout () {
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
