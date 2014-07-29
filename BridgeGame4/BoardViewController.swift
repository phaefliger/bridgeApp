//
//  BoardViewController.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/11/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // These outlet variables correspond to the tableviews, imageviews and labels located on the board.
    @IBOutlet var NPlayerTable : UITableView
    @IBOutlet var EPlayerTable : UITableView
    @IBOutlet var SPlayerTable : UITableView
    @IBOutlet var WPlayerTable : UITableView
    @IBOutlet var player1Suit: UIImageView
    @IBOutlet var player2Suit: UIImageView
    @IBOutlet var player3Suit: UIImageView
    @IBOutlet var player4Suit: UIImageView
    @IBOutlet var player1Numb: UILabel
    @IBOutlet var player2Numb: UILabel
    @IBOutlet var player3Numb: UILabel
    @IBOutlet var player4Numb: UILabel
    @IBOutlet var sPlayerLabel : UILabel
    @IBOutlet var wPlayerLabel : UILabel
    @IBOutlet var nPlayerLabel : UILabel
    @IBOutlet var ePlayerLabel : UILabel
    @IBOutlet var background:  UIImageView
    var player1:Player?
    var player2:Player?
    var player3:Player?
    var player4:Player?
    var currentPlayer: Player?
    var rootViewController:BidViewController?
    var players = Player[]()
    var passBidCounter:Int = 0
    var currentPlayerNumber:Int = 0
    var isTurnOne = true
    var finalBid:Bid?
    var game:Game?
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        player1 = game!.teamNS!.player1!
        player2 = game!.teamWE!.player1!
        player3 = game!.teamNS!.player2!
        player4 = game!.teamWE!.player2!
        background.image = UIImage(named: "cardtablebackground.jpeg")
        player1Numb.text = ""
        player2Numb.text = ""
        player3Numb.text = ""
        player4Numb.text = ""
        players.append(player1!)
        players.append(player2!)
        players.append(player3!)
        players.append(player4!)
        currentPlayer = players[0]
        player1!.name = sPlayerLabel
        player2!.name = wPlayerLabel
        player3!.name = nPlayerLabel
        player4!.name = ePlayerLabel
        player1!.currentHand.latestBidImage = player1Suit
        player1!.currentHand.latestBidNumb = player1Numb
        player2!.currentHand.latestBidImage = player2Suit
        player2!.currentHand.latestBidNumb = player2Numb
        player3!.currentHand.latestBidImage = player3Suit
        player3!.currentHand.latestBidNumb = player3Numb
        player4!.currentHand.latestBidImage = player4Suit
        player4!.currentHand.latestBidNumb = player4Numb
        currentPlayer!.name!.textColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    //TableView DataSource Methods
    
    /*
        Total number of possible bids for any player is 7
    */
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    /*
        The tableviews for the players individual bid histories should not be selectable.
    */
    func tableView(tableView: UITableView!, willSelectRowAtIndexPath indexPath: NSIndexPath!) -> NSIndexPath!
    {
        return nil
    }
    
    
    /*
        Grabs a cell and customizes it based on the bid history of the player it is correlated with. Calls configure cell to do the grunt work.
    */
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("BidChoice", forIndexPath: indexPath) as BidTableViewCell
        if tableView == SPlayerTable{
            var label:UILabel = cell.viewWithTag(1011) as UILabel
            var imageview:UIImageView = cell.viewWithTag(1001) as UIImageView
            if indexPath.row < player1!.currentHand.bidHistory.count{
                configureCell(label, cellForRowAtIndexpath: indexPath, withBidHistory: player1!.currentHand.bidHistory, andImage: imageview)
            }
            else {
                label.text = ""
                imageview.image = nil
            }
        }
        else if tableView == WPlayerTable{
            var label:UILabel = cell.viewWithTag(1022) as UILabel
            var imageview:UIImageView = cell.viewWithTag(1002) as UIImageView
            
            if indexPath.row < player2!.currentHand.bidHistory.count{
                configureCell(label, cellForRowAtIndexpath: indexPath, withBidHistory: player2!.currentHand.bidHistory, andImage: imageview)
            }
            else {
                label.text = ""
                imageview.image = nil
            }
        }
        else if tableView == NPlayerTable{
            var label:UILabel = cell.viewWithTag(1033) as UILabel
            var imageview:UIImageView = cell.viewWithTag(1003) as UIImageView
            if indexPath.row < player3!.currentHand.bidHistory.count{
                configureCell(label, cellForRowAtIndexpath: indexPath, withBidHistory: player3!.currentHand.bidHistory, andImage: imageview)
            }
            else {
                label.text = ""
                imageview.image = nil
            }
        }
        else if tableView == EPlayerTable{
            var label:UILabel = cell.viewWithTag(1044) as UILabel
            var imageview:UIImageView = cell.viewWithTag(1004) as UIImageView
            if indexPath.row < player4!.currentHand.bidHistory.count{
                configureCell(label, cellForRowAtIndexpath: indexPath, withBidHistory: player4!.currentHand.bidHistory, andImage: imageview)
            }
            else {
                label.text = ""
                imageview.image = nil
            }
        }
        return cell
    }
    /*
        Customize the cell based on the given bid history and label.
    */
    
    func configureCell(label:UILabel, cellForRowAtIndexpath indexpath:NSIndexPath, withBidHistory bidHistory:Bid[], andImage imageview:UIImageView){
        var bid = bidHistory[indexpath.row]
        imageview.image = bid.suitImage
        if bid.suit == "P"{
            label.text = "Pass"
            return
        }
        label.text = "\(bid.numb)"
        
        
    }
    
    /*
    
    */
    func updateAfterBid(bid:Bid){
        isTurnOne = false
        if bid.isMemberOfClass(PassBid){
            self.updateAfterPassBid(bid)
            return
        }
        else{
            passBidCounter = 0
            finalBid = bid
            if currentPlayer! == player1! || currentPlayer! == player3!{
                game!.teamNS!.isCurrentTeam = true
                game!.teamWE!.isCurrentTeam = false
            }
            else {
                game!.teamWE!.isCurrentTeam = true
                game!.teamNS!.isCurrentTeam = false
            }
            currentPlayer!.currentHand.latestBid = bid
            currentPlayer!.currentHand.bidHistory.insert(bid, atIndex: 0)
            currentPlayer!.currentHand.latestBidImage!.image = bid.suitImage
            currentPlayer!.currentHand.latestBidNumb!.text = "\(bid.numb)"
        }
        self.nextPlayer()
    }
    
    
    /*
        Encapsulates what happens when someone passes as their bid.
    */
    func updateAfterPassBid(bid:Bid){
        passBidCounter++
        if isTurnOne{
            if passBidCounter == 4{
                var alert:UIAlertController = UIAlertController(title: "Caution", message: "This bid will end the round and start a new hand. Are you sure you wish to continue?", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler:{alert in
                    //self.rootViewController!.startNewHand()
                
                
                    }))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {alert  in
                    self.passBidCounter = 3
                    return
                
                    }))
            
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
            else{
                currentPlayer!.currentHand.latestBid = bid
                currentPlayer!.currentHand.bidHistory.insert(bid, atIndex: 0)
                currentPlayer!.currentHand.latestBidImage!.image = nil
                currentPlayer!.currentHand.latestBidNumb!.text = "Pass"
                self.nextPlayer()
            }
        }
        else{
            if passBidCounter == 3{
                var alert:UIAlertController = UIAlertController(title: "Caution", message: "Are you sure this is your final bid?", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler:{
                    alert in
                    self.currentPlayer!.currentHand.latestBid = bid
                    self.currentPlayer!.currentHand.bidHistory.insert(bid, atIndex: 0)
                    self.currentPlayer!.currentHand.latestBidImage!.image = nil
                    self.currentPlayer!.currentHand.latestBidNumb!.text = "Pass"
                    self.nextPlayer()
                    self.rootViewController!.finalBid(self.finalBid!)
                    }))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:{
                    alert in
                    self.passBidCounter = 2
                    }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else{
                currentPlayer!.currentHand.latestBid = bid
                currentPlayer!.currentHand.bidHistory.insert(bid, atIndex: 0)
                currentPlayer!.currentHand.latestBidImage!.image = nil
                currentPlayer!.currentHand.latestBidNumb!.text = "Pass"
                self.nextPlayer()
            }
        }
        
    }
    /*
        Encapsulate the changing of the current bidding player. Reload the data for the specific table view being used and, change the current player and notify the user of the change with the chaning font color.
    */
    func nextPlayer(){
        if passBidCounter == 3{
            //rootViewController!.slide()
        }
        if currentPlayer == player1{
            SPlayerTable.reloadData()
        }
        else if currentPlayer == player2{
            WPlayerTable.reloadData()
        }
        else if currentPlayer == player3{
            NPlayerTable.reloadData()
        }
        else {
            EPlayerTable.reloadData()
        }
        currentPlayer!.name!.textColor = UIColor.blackColor()
        if currentPlayerNumber == 3 {
            isTurnOne = false
            currentPlayerNumber = 0
            currentPlayer = players[currentPlayerNumber]
        }
        else {
            currentPlayer = players[++currentPlayerNumber]
        }
        currentPlayer!.name!.textColor = UIColor.redColor()
    }
    
    func newHand(){
        currentPlayer = player1
        currentPlayerNumber = 0
        player1Numb.text = ""
        player2Numb.text = ""
        player3Numb.text = ""
        player4Numb.text = ""
        player1Suit.image = nil
        player2Suit.image = nil
        player3Suit.image = nil
        player4Suit.image = nil
        SPlayerTable.reloadData()
        WPlayerTable.reloadData()
        NPlayerTable.reloadData()
        EPlayerTable.reloadData()
        player1!.currentHand.latestBidImage = player1Suit
        player1!.currentHand.latestBidNumb = player1Numb
        player2!.currentHand.latestBidImage = player2Suit
        player2!.currentHand.latestBidNumb = player2Numb
        player3!.currentHand.latestBidImage = player3Suit
        player3!.currentHand.latestBidNumb = player3Numb
        player4!.currentHand.latestBidImage = player4Suit
        player4!.currentHand.latestBidNumb = player4Numb    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        
    }
    

}
