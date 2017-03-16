//
//  MapViewController.swift
//  Jive Factory
//
//  Created by n on 12/11/15.
//  Copyright © 2015 Noble Desktop. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let jiveLatitude = 40.72004
    let jiveLongitude = -74.003912
    let jiveSpan = 0.05
    
    @IBOutlet weak var jiveMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var jiveRegion = MKCoordinateRegion()
        var center = CLLocationCoordinate2D()
        center.latitude = jiveLatitude
        center.longitude = jiveLongitude
        var span = MKCoordinateSpan()
        span.latitudeDelta = jiveSpan
        span.longitudeDelta = jiveSpan
        
        jiveRegion.center = center
        jiveRegion.span = span
        jiveMapView.setRegion(jiveRegion, animated: true)
        
        let jivePoint = MKPointAnnotation()
        jivePoint.coordinate = center
        jivePoint.title = "The Jive Factory"
        jivePoint.subtitle = "580 Lispenard, NY, NY 10013"
        jiveMapView.addAnnotation(jivePoint)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
