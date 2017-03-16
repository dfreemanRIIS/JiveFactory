//
//  BandsTableViewController.swift
//  Jive Factory
//
//  Created by n on 12/10/15.
//  Copyright © 2015 Noble Desktop. All rights reserved.
//

import UIKit
import Firebase

class BandsTableViewController: UITableViewController {
    
    let bandsModel = BandsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = UIActivityIndicatorView(activityIndicatorStyle:
            UIActivityIndicatorViewStyle.gray)
        loader.frame = CGRect(x: (self.view.frame.size.width-40)/2, y: (self.view.frame.size.height-40)/2, width: 40.0, height: 40.0)
        self.view.addSubview(loader)
        loader.startAnimating()
        
        bandsModel.fetch {[weak self] (Void) -> Void in
            if let strongSelf = self {
                loader.stopAnimating()
                strongSelf.tableView.reloadData()
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

        // Configure the cell...
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
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
            
                let bandsDetailViewController:BandsDetailViewController = segue.destination as! BandsDetailViewController
                let bandDetail = bandsModel.bandDetails[indexPath.row]
                bandsDetailViewController.currentBandDetail = bandDetail
            }
        }
    }


}
