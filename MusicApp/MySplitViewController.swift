//
//  MySplitViewController.swift
//  MusicApp
//
//  Created by Brian Marshall on 3/17/17.
//  Copyright © 2017 Brian Marshall. All rights reserved.
//

import UIKit

class MySplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let leftNavController = self.viewControllers.first as! UINavigationController
        let masterViewController = leftNavController.topViewController as! BandsTableViewController
        let detailViewController = self.viewControllers.last as! BandsDetailViewController
        masterViewController.detailViewController = detailViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
