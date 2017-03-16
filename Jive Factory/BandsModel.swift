//
//  BandsModel.swift
//  Jive Factory
//
//  Created by n on 12/14/15.
//  Copyright © 2015 Noble Desktop. All rights reserved.
//

import UIKit
import Firebase

class BandsModel: NSObject {
    var bandDetails = [BandDetail]()
    func fetch(_ complete:@escaping (Void)->Void){
        
        // Get a reference to my Firebase URL
        //let myRootRef = Firebase(url:"https://test-4f983.firebaseio.com/ ")
        let myRootRef = FIRDatabase.database().reference()
        
        // Attach a closure to read the data stored at the URL
        myRootRef.observe(.value, with: {[weak self]
            snapshot in
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    if let array = snap.value as? NSArray {
                        for dict in array {
                            if let object = dict as? Dictionary<String, AnyObject> {
                                let bandDetail = BandDetail()
                                bandDetail.bandName = object["bandName"] as? String
                                bandDetail.bandType = object["bandType"] as? String
                                bandDetail.bandDescription = object["bandDescription"] as? String
                                bandDetail.fullImageName = object["fullImageName"] as? String
                                bandDetail.thumbImageName = object["thumbImageName"] as? String
                                bandDetail.nextShowDate = object["nextShowDate"] as? String
                                bandDetail.nextShowTime = object["nextShowTime"] as? String
                                bandDetail.venue = object["venue"] as? String
                                bandDetail.showDetails = object["showDetails"] as? String
                                bandDetail.videoURL = object["videoURL"] as? String
                                
                                // A little memory management
                                if let strongSelf = self {
                                    strongSelf.bandDetails.append(bandDetail)
                                }
                                
                            }
                        }
                    }
                    complete()
                }
            }   })
        
    }
    
    
    
    
    
    
    
    //func fetch(complete:(Void)->Void){
    //
    //    let myRootRef = Firebase(url:"https://dazzling-inferno-7155.firebaseio.com")
    //    myRootRef.observeEventType(.Value, withBlock: {[weak self]
    //        snapshot in
    //
    //        if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
    //            print(snapshot.value)
    //            for snap in snapshots {
    //                if let array = snap.value as? NSArray {
    //                    for dict in array {
    //                        if let object = dict as? Dictionary<String, AnyObject> {
    //                            let bandDetail = BandDetail()
    //                            bandDetail.bandName = object["bandName"] as? String
    //                            bandDetail.bandType = object["bandType"] as? String
    //                            bandDetail.bandDescription = object["bandDescription"] as? String
    //                            bandDetail.fullImageName = object["fullImageName"] as? String
    //                            bandDetail.thumbImageName = object["thumbImageName"] as? String
    //                            bandDetail.nextShowDate = object["nextShowDate"] as? String
    //                            bandDetail.nextShowTime = object["nextShowTime"] as? String
    //                            bandDetail.venue = object["venue"] as? String
    //                            bandDetail.showDetails = object["showDetails"] as? String
    //                            bandDetail.videoURL = object["videoURL"] as? String
    //
    //                            if let strongSelf = self {
    //                                strongSelf.bandDetails.append(bandDetail)
    //                            }
    //
    //                        }
    //                    }
    //                }
    //                complete()
    //            }
    //        }    })
    //}
}
