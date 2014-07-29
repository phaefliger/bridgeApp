//
//  BidViewController.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/10/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class BidViewController: UIViewController {
    @IBOutlet var BoardView : UIView
    @IBOutlet var DoneView : UIView
    @IBOutlet var BiddingView : UIView
    
    var bidChoiceController:BidChoiceViewController?
    var boardController:BoardViewController?
    var doneController:DoneBiddingViewController?
    var game:Game?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (self.tabBarController.viewControllers[1] as ScoreViewController).game = game!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        
        var segueName = segue.identifier
        if (segueName == "BidChoice"){
            bidChoiceController = segue.destinationViewController as BidChoiceViewController!
            bidChoiceController!.game = game!
            bidChoiceController!.rootViewController = self
        }
        else if (segueName == "Board"){
            boardController = segue.destinationViewController as BoardViewController!
            boardController!.game = game!
            boardController!.rootViewController = self
        }
        else if (segueName == "Done"){
            doneController = segue.destinationViewController as DoneBiddingViewController!
            doneController!.game = game!
            doneController!.rootViewController = self
        }
    }
    func finalBid(bid:Bid){
        doneController!.setFinalBid(bid)
        self.view.bringSubviewToFront(DoneView)
    }
    
    func newHand(){
        self.view.bringSubviewToFront(BiddingView)
        game!.teamNS!.player1!.finishHand()
        game!.teamNS!.player2!.finishHand()
        game!.teamWE!.player1!.finishHand()
        game!.teamWE!.player2!.finishHand()
        boardController!.newHand()
        bidChoiceController!.newHand()
    }
}

