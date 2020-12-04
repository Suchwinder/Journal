//
//  CalendarViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/3/20.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {
    var currentMood: String!
    var currentDate: String!
    var moodsDict: [String: String] = [:]

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var calendar: FSCalendar!
    
    func updateLabel () {
        moodLabel.text = currentMood
        dateLabel.text = currentDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMood = "N/A"
        currentDate = "MM-dd-YYYY"
        updateLabel()
        calendar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM-dd-YYYY"
        let date = dateformatter.string(from: date)
        currentDate = date
        
        // check if current date has some mood stored if not then N/A
        let keyExists = moodsDict[date] != nil
        if keyExists {
            currentMood = moodsDict[date]
        } else {
            currentMood = "No Mood"
        }
        updateLabel()
    }
    
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
