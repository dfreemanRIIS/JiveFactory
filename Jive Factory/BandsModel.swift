//
//  BandsModel.swift
//  Jive Factory
//
//  Created by Donald Freeman on 3/15/17.
//  Copyright © 2017 Noble Desktop. All rights reserved.
//

import UIKit

class BandsModel: NSObject {
    var bandDetails = [BandDetail]()
    
    func fetch() {
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
}
