//
//  WebViewController.swift
//  Jive Factory
//
//  Created by Donald Freeman on 3/14/17.
//  Copyright © 2017 Noble Desktop. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var siteWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jiveURL = NSURL(string: "http://www.thejivefactory.com")
        let myNSURLRequest = NSURLRequest(url: jiveURL! as URL)
        siteWebView.loadRequest(myNSURLRequest as URLRequest)

        // Do any additional setup after loading the view.
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
