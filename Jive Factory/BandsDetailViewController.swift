//
//  BandsDetailViewController.swift
//  Jive Factory
//
//  Created by Donald Freeman on 3/14/17.
//  Copyright © 2017 Noble Desktop. All rights reserved.
//

import UIKit

class BandsDetailViewController: UIViewController {

    var currentBandDetail:BandDetail?

    @IBOutlet weak var bandTypeLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var showDateLabel: UILabel!
    @IBOutlet weak var showTimeLabel: UILabel!
    @IBOutlet weak var showDetailsLabel: UILabel!
    @IBOutlet weak var bandDescriptionLabel: UILabel!
    @IBOutlet weak var bandImage: UIImageView!
    @IBOutlet weak var bandNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        bandNameLabel.text = currentBandDetail?.bandName
        bandTypeLabel.text = currentBandDetail?.bandType
        venueLabel.text = currentBandDetail?.venue
        showDateLabel.text = currentBandDetail?.nextShowDate
        showTimeLabel.text = currentBandDetail?.nextShowTime
        showDetailsLabel.text = currentBandDetail?.showDetails
        bandDescriptionLabel.text = currentBandDetail?.bandDescription
        bandImage.image = UIImage(named: currentBandDetail!.fullImageName!)
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
