//
//  BandsTableViewController.swift
//  MusicApp
//
//  Created by Brian Marshall on 3/13/17.
//  Copyright © 2017 Brian Marshall. All rights reserved.
//

import UIKit
import Firebase
import SystemConfiguration

class BandsTableViewController: UITableViewController {

    let bandsModel = BandsModel()
    let loader = UIActivityIndicatorView(activityIndicatorStyle:
        UIActivityIndicatorViewStyle.gray)
    
    var detailViewController:BandsDetailViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.frame = CGRect(x: (self.view.frame.size.width-40)/2, y: (self.view.frame.size.height-40)/2, width: 40.0, height: 40.0)
        
        self.view.addSubview(loader)
        loader.startAnimating()
        
        self.refreshControl?.addTarget(self, action: "refresh", for:
            UIControlEvents.valueChanged)
        
        if(isInternetAvailable()){
        bandsModel.fetch {[weak self] (Void) -> Void in
            if let strongSelf = self {
                self?.loader.stopAnimating()
                if strongSelf.bandsModel.isError {
                    strongSelf.handleError()
                } else {
                strongSelf.tableView.reloadData()
                }
            }
        }
        } else{
            handleError()
        }
    }
    
    func handleError() {
        let alert = UIAlertView(title: "Alert", message: "Oops! It’s not you, it’s us. No data could be loaded. Please try again later.", delegate: nil, cancelButtonTitle: "Cancel")
        alert.show()
    }
    
    func refresh() {
        bandsModel.bandDetails.removeAll(keepingCapacity: false)
        if(isInternetAvailable()){
            bandsModel.fetch {[weak self] (Void) -> Void in
                if let strongSelf = self {
                    strongSelf.refreshControl?.endRefreshing()
                    if strongSelf.bandsModel.isError {
                        strongSelf.handleError()
                    } else {
                        strongSelf.tableView.reloadData()
                    }
                }
            }
        } else{
            handleError()
        }
    }
    
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (UIDevice.current.model.range(of: "iPad") != nil) {
            let bandDetail = bandsModel.bandDetails[indexPath.row]
            detailViewController.currentBandDetail = bandDetail
            detailViewController.refreshView()
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let bandsDetailViewController:BandsDetailViewController =
                    segue.destination as! BandsDetailViewController
                let bandDetail = bandsModel.bandDetails[indexPath.row]
                bandsDetailViewController.currentBandDetail =
                    bandDetail
            } }
    }
}
