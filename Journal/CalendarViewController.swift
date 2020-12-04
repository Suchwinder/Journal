//
//  CalendarViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/3/20.
//

import UIKit

class CalendarViewController: UIViewController {
    var currentMood: String!
    var currentDate: String!
    var moodsDict: [String: String] = [:]

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func updateLabel () {
        moodLabel.text = currentMood
        dateLabel.text = currentDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMood = "test"
        currentDate = "MM-dd-YYYY"
        updateLabel()
        // Do any additional setup after loading the view.
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
