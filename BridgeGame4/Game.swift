//
//  Game.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/24/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class Game: NSObject {
    var teamNS:Team?
    var teamWE:Team?
    var lastBid:Bid?
    
    
    init(teamNS:Team!, teamWE:Team!){
        self.teamNS = teamNS
        self.teamWE = teamWE
        
    }
    func finishRound(){
        teamNS!.player1!.finishHand()
        teamWE!.player1!.finishHand()
        teamNS!.player2!.finishHand()
        teamWE!.player2!.finishHand()
    }
}
