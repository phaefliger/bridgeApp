//
//  ScoreViewController.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/10/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet var UsOverTheLineR1 : UITextView
    @IBOutlet var UsR1Game1 : UITextView
    @IBOutlet var UsR1Game2 : UITextView
    @IBOutlet var UsR1Game3 : UITextView
    @IBOutlet var ThemOverTheLineR1 : UITextView
    @IBOutlet var ThemR1Game1 : UITextView
    @IBOutlet var ThemR1Game2 : UITextView
    @IBOutlet var ThemR1Game3 : UITextView
    @IBOutlet var scorePadImage : UIImageView
   
    var overTheLine:Int = 0
    var underTheLine:Int = 0
    var currentGameNumb:Int = 1
    var currentTeam:Team?
    var game:Game?
    
    init(coder aDecoder: NSCoder!){
        super.init(coder: aDecoder)
    }
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scorePadImage.image = UIImage(named: "ScorePad.jpeg")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
        self.resetScores()
        NSLog(UsR1Game1.text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func calculateScoreWithBid(bid:Bid, andTricks tricks:Int){
        if game!.teamNS!.isCurrentTeam == true {
            currentTeam = game!.teamNS!
        }
        else if game!.teamWE!.isCurrentTeam {
            currentTeam = game!.teamWE!
        }
        game!.finishRound()
        if bid.type! == "Minor"{
            if tricks >= 0{
                underTheLine = bid.numb! * 20
                overTheLine = tricks * 20
            }
        }
        else if bid.type! == "Major"{
            if tricks >= 0{
                underTheLine = bid.numb! * 30
                overTheLine = tricks * 30
            }
        }
        else {
            if tricks >= 0{
                underTheLine = 40
                underTheLine += (bid.numb! - 1) * 30
                overTheLine = tricks * 30
            }
            
                
            
        }
        switch(currentGameNumb){
        case(1):
            currentTeam!.game1Text += "\n\(underTheLine)"
        case(2):
            currentTeam!.game2Text += "\n\(underTheLine)"
        case(3):
            currentTeam!.game3Text += "\n\(underTheLine)"
        default:
            break
        }
        currentTeam!.totalPoints += overTheLine
        currentTeam!.totalPoints += underTheLine
        currentTeam!.currentUnderPoints += underTheLine
        if currentTeam!.currentUnderPoints >= 100 {
            currentTeam!.gamesWon++
            currentGameNumb++
            currentTeam!.vulnerable = true
            currentTeam!.currentUnderPoints = 0
            if currentTeam!.gamesWon == 2 {
                currentTeam!.rubbersWon++
            }
        }
        (self.tabBarController as Root).newHand()
        
    }
    func resetScores(){
        UsOverTheLineR1.text = game!.teamNS!.overTheLineText
        UsR1Game1.text = game!.teamNS!.game1Text
        UsR1Game2.text = game!.teamNS!.game2Text
        UsR1Game3.text = game!.teamNS!.game3Text
        ThemOverTheLineR1.text = game!.teamWE!.overTheLineText
        ThemR1Game1.text = game!.teamWE!.game1Text
        ThemR1Game2.text = game!.teamWE!.game2Text
        ThemR1Game3.text = game!.teamWE!.game3Text
    }
    
}

