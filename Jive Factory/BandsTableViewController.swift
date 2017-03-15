//
//  BandsTableViewController.swift
//  Jive Factory
//
//  Created by Donald Freeman on 3/13/17.
//  Copyright © 2017 Noble Desktop. All rights reserved.
//

import UIKit

class BandsTableViewController: UITableViewController {

    let bandTitles = ["Nicole Atkins", "Ambulance LTD", "Sleepies", "Black Angels"]
    let bandSubTitles = ["Tue 5/1", "Fri 5/4", "Sat 5/5", "Sun 5/6",]
    let bandImageNames = ["thumb-nicole-atkins.png", "thumb-ambulance-ltd.png", "thumb-sleepies.png", "thumb-black-angels.png"]
    var bandDetails = [BandDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nicoleAtkinsBandDetail = BandDetail()
        nicoleAtkinsBandDetail.bandName = "Nicole Atkins"
        nicoleAtkinsBandDetail.bandType = "Rock"
        nicoleAtkinsBandDetail.bandDescription = "Nicole will knock your socks off."
        nicoleAtkinsBandDetail.fullImageName = "full-nicole-atkins.png"
        nicoleAtkinsBandDetail.thumbImageName = "thumb-nicole-atkins.png"
        nicoleAtkinsBandDetail.nextShowDate = "Tue 5/1"
        nicoleAtkinsBandDetail.nextShowTime = "8pm"
        nicoleAtkinsBandDetail.venue = "Bowery Ballroom"
        nicoleAtkinsBandDetail.showDetails = "All ages - $35"
        nicoleAtkinsBandDetail.videoURL = "http://www.youtube.com/embed/Go9k14yrxeQ?rel=0"
        
        let ambulanceLtdDetails = BandDetail()
        ambulanceLtdDetails.bandName = "Ambulance LTD"
        ambulanceLtdDetails.bandType = "Indie Rock"
        ambulanceLtdDetails.bandDescription = "It's been 2 years since Ambulance LTD has played in NYC. Don't miss them!"
        ambulanceLtdDetails.fullImageName = "full-ambulance-ltd.png"
        ambulanceLtdDetails.thumbImageName = "thumb-ambulance-ltd.png"
        ambulanceLtdDetails.nextShowDate = "Fri 5/4"
        ambulanceLtdDetails.nextShowTime = "10:30pm"
        ambulanceLtdDetails.venue = "Mercury Lounge"
        ambulanceLtdDetails.showDetails = "All ages - $18"
        ambulanceLtdDetails.videoURL = "http://www.youtube.com/embed/l2uzjdxRVyw?rel=0"
        
        let sleepiesDetails = BandDetail()
        sleepiesDetails.bandName = "Sleepies"
        sleepiesDetails.bandType = "Punk"
        sleepiesDetails.bandDescription = "Come for the music, or for the show. Sleepies always impresses."
        sleepiesDetails.fullImageName = "full-sleepies.png"
        sleepiesDetails.thumbImageName = "thumb-sleepies.png"
        sleepiesDetails.nextShowDate = "Sat 5/5"
        sleepiesDetails.nextShowTime = "10:30pm"
        sleepiesDetails.venue = "Jive Factory"
        sleepiesDetails.showDetails = "Over 21 - $20"
        sleepiesDetails.videoURL = "http://www.youtube.com/embed/npQNt3YDI5Q?rel=0"
        
        let blackAngelsDetails = BandDetail()
        blackAngelsDetails.bandName = "Black Angels"
        blackAngelsDetails.bandType = "Rock"
        blackAngelsDetails.bandDescription = "Next year these guys will be selling-out much bigger venues."
        blackAngelsDetails.fullImageName = "full-black-angels.png"
        blackAngelsDetails.thumbImageName = "thumb-black-angels.png"
        blackAngelsDetails.nextShowDate = "Sun 5/6"
        blackAngelsDetails.nextShowTime = "8pm"
        blackAngelsDetails.venue = "Cake Shop"
        blackAngelsDetails.showDetails = "Over 21 - $15"
        blackAngelsDetails.videoURL = "http://www.youtube.com/embed/c-VEcHM-UVY?rel=0"
        
        bandDetails.append(nicoleAtkinsBandDetail)
        bandDetails.append(ambulanceLtdDetails)
        bandDetails.append(sleepiesDetails)
        bandDetails.append(blackAngelsDetails)
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
        return bandTitles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bandCell", for: indexPath)

        cell.textLabel?.text = bandTitles[indexPath.row]
        cell.detailTextLabel?.text = bandSubTitles[indexPath.row]
        cell.imageView?.image = UIImage(named: bandImageNames[indexPath.row])
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
                bandsDetailViewController.currentBandDetail =
                    bandDetails[indexPath.row]
            }
        }
    }
}
