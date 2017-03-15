//
//  BandsTableViewController.swift
//  Jive Factory
//
//  Created by Donald Freeman on 3/13/17.
//  Copyright © 2017 Noble Desktop. All rights reserved.
//

import UIKit
import Firebase

class BandsTableViewController: UITableViewController {

    let bandsModel = BandsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bandsModel.fetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bandsModel.bandDetails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bandCell", for: indexPath)

        let bandDetail = bandsModel.bandDetails[indexPath.row]
        cell.textLabel?.text = bandDetail.bandName
        cell.detailTextLabel?.text = bandDetail.nextShowDate
        cell.imageView?.image = UIImage(named: bandDetail.thumbImageName!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 88
    }

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let bandsDetailViewController:BandsDetailViewController =
                    segue.destination as! BandsDetailViewController
                let bandDetail = bandsModel.bandDetails[indexPath.row]
                bandsDetailViewController.currentBandDetail = bandDetail
            }
        }
    }
}
