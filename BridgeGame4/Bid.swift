//
//  Bid.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/11/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.

import UIKit


/*
    Represents a bid made in the actual game. Each bid has a suitImage, number and suit. Bids can be compared to one another.
*/
class Bid: NSObject {
    var suit:String?
    var numb: Int?
    var suitImage: UIImage?
    var type:String?
    
    init() {
        super.init()
    }
    init(newSuit:String, withNumb newNumb:String, andImage newImage:UIImage, andType type:String){
        self.type = type
        suitImage = newImage
        suit = newSuit
        numb = newNumb.toInt()!
    }
    
    /*
        Compares two bids and returns a bool. Returns true if the first bid is greater and false if it is less than or equal.
    */
    
    func compare(bid1:Bid, withBid bid2:Bid)->Bool{
        
        if(bid1.numb > bid2.numb)
        {
            return true;
        }else if(bid1.numb < bid2.numb)
        {
            return false;
        }else
        {
            if bid1.suit == bid2.suit {
                return false
            }
            if (bid1.suit == "NT") {
                return true;
            }
                
            else if bid1.suit == "S" && !(bid2.suit == "NT"){
                return true;
            }
                
            else if bid1.suit == "H" && !(bid2.suit == "S") && !(bid2.suit == "NT"){
                return true;
            }
                
            else if bid1.suit == "D" && bid2.suit == "C"{
                return true;
            }
            
            return false;
            
        }
    }
}
