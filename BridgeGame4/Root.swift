//
//  Root.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/28/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class Root: UITabBarController {
    var game:Game
    let scoreController:ScoreViewController?
    let bidController:BidViewController?
    
    init(coder aDecoder: NSCoder!) {
        let teamNS = Team(player1:Player(), player2:Player())
        let teamWE = Team(player1:Player(), player2:Player())
        game = Game(teamNS:teamNS, teamWE:teamWE)
        
        super.init(coder: aDecoder)
        scoreController = viewControllers[1] as? ScoreViewController
        bidController = viewControllers[0] as? BidViewController
        bidController!.game = game
        scoreController!.game = game
    }
 
    func newHand(){
        bidController!.newHand()
    }
}
