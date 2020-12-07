//
//  EditMoodViewController.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/6/20.
//

import UIKit

// create own protocol to update textfield when needed
// will implement inside the class
protocol EditMoodViewControllerDelegate: class {
  func editMoodViewControllerDidCancel(
    _ controller: EditMoodViewController)
  func editMoodViewController(
    _ controller: EditMoodViewController,
    didFinishEditing item: MoodItem)
}

class EditMoodViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: EditMoodViewControllerDelegate?
    var moodItem: MoodItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // load the item selected
        textField.text = moodItem.mood
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // giving control focus onto the textfield on screen render
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

//    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }
    
    // MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK:- Actions
    @IBAction func cancel() {
        delegate?.editMoodViewControllerDidCancel(self)
    }

    @IBAction func done() {
        moodItem.mood = textField.text!
        delegate?.editMoodViewController(self, didFinishEditing: moodItem)
    }
    
    // MARK: - Text Field Delegates
    
    // enabling done button only if
    // text field isn't empty
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

      let oldText = textField.text!
      let stringRange = Range(range, in:oldText)!
      let newText = oldText.replacingCharacters(in: stringRange,
                                              with: string)
      doneBarButton.isEnabled = !newText.isEmpty
      
      return true
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
