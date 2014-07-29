//
//  PassBid.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/11/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class PassBid: Bid {
    init(){
        super.init()
        suit = "P"
    }
    override func compare(bid1: Bid, withBid bid2: Bid) -> Bool {
        return false
    }
}
