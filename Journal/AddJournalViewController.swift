//
//  AddJournalViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/3/20.
//

import UIKit

class AddJournalViewController: UIViewController {
    @IBOutlet weak var inputLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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
