//
//  BidChoiceViewController.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/11/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class BidChoiceViewController: UITableViewController {
    var rootViewController:BidViewController?
    var possibleBids: Bid[] = []
    var availableBids: Bid[] = []
    var latestBid: Bid?
    var game:Game?
    
    // Initializers
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    init(style: UITableViewStyle) {
        super.init(style: style)
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        possibleBids.append(Bid(newSuit: "C", withNumb: "1", andImage: UIImage(named: "club.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "D", withNumb: "1", andImage: UIImage(named: "diamond.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "H", withNumb: "1", andImage: UIImage(named: "heart.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "S", withNumb: "1", andImage: UIImage(named: "spade.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "NT", withNumb: "1", andImage: UIImage(named: "notrump.jpeg"), andType:"NoTrump"))
        possibleBids.append(Bid(newSuit: "C", withNumb: "2", andImage: UIImage(named: "club.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "D", withNumb: "2", andImage: UIImage(named: "diamond.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "H", withNumb: "2", andImage: UIImage(named: "heart.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "S", withNumb: "2", andImage: UIImage(named: "spade.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "NT", withNumb: "2", andImage: UIImage(named: "notrump.jpeg"), andType:"NoTrump"))
        possibleBids.append(Bid(newSuit: "C", withNumb: "3", andImage: UIImage(named: "club.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "D", withNumb: "3", andImage: UIImage(named: "diamond.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "H", withNumb: "3", andImage: UIImage(named: "heart.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "S", withNumb: "3", andImage: UIImage(named: "spade.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "NT", withNumb: "3", andImage: UIImage(named: "notrump.jpeg"), andType:"NoTrump"))
        possibleBids.append(Bid(newSuit: "C", withNumb: "4", andImage: UIImage(named: "club.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "D", withNumb: "4", andImage: UIImage(named: "diamond.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "H", withNumb: "4", andImage: UIImage(named: "heart.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "S", withNumb: "4", andImage: UIImage(named: "spade.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "NT", withNumb: "4", andImage: UIImage(named: "notrump.jpeg"), andType:"NoTrump"))
        possibleBids.append(Bid(newSuit: "C", withNumb: "5", andImage: UIImage(named: "club.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "D", withNumb: "5", andImage: UIImage(named: "diamond.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "H", withNumb: "5", andImage: UIImage(named: "heart.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "S", withNumb: "5", andImage: UIImage(named: "spade.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "NT", withNumb: "5", andImage: UIImage(named: "notrump.jpeg"), andType:"NoTrump"))
        possibleBids.append(Bid(newSuit: "C", withNumb: "6", andImage: UIImage(named: "club.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "D", withNumb: "6", andImage: UIImage(named: "diamond.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "H", withNumb: "6", andImage: UIImage(named: "heart.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "S", withNumb: "6", andImage: UIImage(named: "spade.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "NT", withNumb: "6", andImage: UIImage(named: "notrump.jpeg"), andType:"NoTrump"))
        possibleBids.append(Bid(newSuit: "C", withNumb: "7", andImage: UIImage(named: "club.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "D", withNumb: "7", andImage: UIImage(named: "diamond.jpeg"), andType:"Minor"))
        possibleBids.append(Bid(newSuit: "H", withNumb: "7", andImage: UIImage(named: "heart.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "S", withNumb: "7", andImage: UIImage(named: "spade.jpeg"), andType:"Major"))
        possibleBids.append(Bid(newSuit: "NT", withNumb: "7", andImage: UIImage(named: "notrump.jpeg"), andType:"NoTrump"))
        var tempImageView = UIImageView(image: UIImage(named: "paper.jpeg"))
        self.tableView.backgroundView = tempImageView
        tableView.opaque = false
        availableBids = possibleBids
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
    // TableView delegate and datasource methods
    
    
    /*
        First section contains the pass bid row. Second section contains the bids available to the user.
    */
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        
        return 2
    }
    /*
        First section only has one row as it only has the pass bid option. The second section depends on the size of the avaiable bids array.
    
    */
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
         return 1
        }
        else{
            return availableBids.count
        }
    }

    /*
        Modifies and returns cell based on three possibilities. One, the cell is in section zero in which case it becomes a pass cell. Otherwise if it is a cell that will not contain a choice it becomes unselectable. Otherwise it takes on the characteristics of its comparable bid.
    */
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("BidChoice", forIndexPath: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.opaque = false
        cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
        cell.contentView.layer.borderWidth = 2.0
        var label:UILabel = cell.viewWithTag(1000) as UILabel
        var imageview:UIImageView = cell.viewWithTag(999) as UIImageView
        switch(indexPath!.section){
        case 0:
            cell.userInteractionEnabled = true
            label.text = "Pass"
            imageview.image = nil
            return cell
        case 1:
            if indexPath!.row >= availableBids.count {
                label.text = ""
                imageview.image = nil
                cell.userInteractionEnabled = false
                return cell
            }
            cell.userInteractionEnabled = true
            var bid:Bid = availableBids[indexPath.row]
            label.text  = "\(bid.numb)"
            imageview.image = bid.suitImage
            return cell
        default:
            return cell
        }

    }
    /*
        Set the latest bid to be a passbid if pass was clicked, otherwise set latestbid to bid correlating to the row number. Compare latest bids to available bids and remove any bids that are less than or equal to the latest bid. Return tableview to the topmost selection and send the bid to the board controller. Reload the tableview data.
    */
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        var cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)
        switch(indexPath.section){
        case 0:
            latestBid = PassBid()
        case 1:
            latestBid = availableBids[indexPath.row]
            while !availableBids[0].compare(availableBids[0], withBid: latestBid!){
                availableBids.removeAtIndex(0)
                if availableBids.isEmpty{
                    break
                }
            }
        default:
            break
        }
        
        tableView.setContentOffset(CGPointZero, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        rootViewController!.boardController!.updateAfterBid(latestBid!)
        self.tableView.reloadData()
    }
    
    
    
    
    func newHand(){
        availableBids = possibleBids
        self.tableView.reloadData()
    }
   

    

    
   
    

}
