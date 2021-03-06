//
//  SettingsTableViewController.swift
//  Fractal
//
//  Created by Sean on 28/11/18.
//  Copyright © 2018 derpydm. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var angleSegmentControl: UISegmentedControl!
    @IBOutlet weak var decimalPlacesLabel: UILabel!
    let angleMeasurementMode = UserDefaults.standard.string(forKey: "angleMeasurementMode") ?? "degrees"
    @IBOutlet weak var decimalPlaceStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        if angleMeasurementMode == "radians" {
            angleSegmentControl.selectedSegmentIndex = 1
        }
        decimalPlacesLabel.text = String(decimalPlaces)
        decimalPlaceStepper.value = Double(decimalPlaces)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func decimalPlacesChanged(_ sender: UIStepper) {
        decimalPlaces = Int(sender.value)
        decimalPlacesLabel.text = String(decimalPlaces)
    }
    // MARK: - Table view data source

    @IBAction func angleMeasurementChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            evaluator.angleMeasurementMode = .degrees
            UserDefaults.standard.set("degrees", forKey: "angleMeasurementMode")
        } else {
            evaluator.angleMeasurementMode = .radians
            UserDefaults.standard.set("radians", forKey: "angleMeasurementMode")
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
