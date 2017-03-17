//
//  WebViewController.swift
//  MusicApp
//
//  Created by Brian Marshall on 3/14/17.
//  Copyright © 2017 Brian Marshall. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var siteWebView: UIWebView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        let jiveURL = NSURL(string: "http://www.thejivefactory.com")
//        let myNSURLRequest = NSURLRequest(url: jiveURL! as URL)
//        siteWebView.loadRequest(myNSURLRequest as URLRequest)
        
        let htmlString = "<html><body><iframe style=\"position:absolute; top:0; left:0; width:100%; height:100%;\" src=\"http://www.youtube.com/embed/Go9k14yrxeQ?rel=0?ecver=2\" frameborder=\"0\" allowfullscreen></iframe></body></html>"

        siteWebView.loadHTMLString(htmlString, baseURL: nil)
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
