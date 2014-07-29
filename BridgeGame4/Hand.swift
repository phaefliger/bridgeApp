//
//  Hand.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/24/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class Hand: NSObject {
    var latestBidImage: UIImageView?
    var latestBidNumb:UILabel?
    var latestBid:Bid?
    var bidHistory = Bid[]()
    
    init(){
        
    }
    
}
