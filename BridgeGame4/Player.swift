//
//  Player.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/14/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class Player: NSObject {
  
    var name: UILabel?
    var pastHands = Hand[]()
    var currentHand = Hand()
    
    init() {
            }
    
    func changeName(newName:String)
    {
        name!.text = newName
    }
    
    func addBid(newBid:Bid)
    {
        currentHand.latestBid = newBid
        currentHand.bidHistory.append(newBid)
        
    }
    func finishHand(){
        pastHands.append(currentHand)
        currentHand = Hand()
    }
}
