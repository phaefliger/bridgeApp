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
    @IBOutlet var UsOverTheLineR2 : UITextView
    @IBOutlet var UsR2Game1 : UITextView
    @IBOutlet var UsR2Game2 : UITextView
    @IBOutlet var UsR2Game3 : UITextView
    @IBOutlet var ThemOverTheLineR2 : UITextView
    @IBOutlet var ThemR2Game1 : UITextView
    @IBOutlet var ThemR2Game2 : UITextView
    @IBOutlet var ThemR2Game3 : UITextView
    @IBOutlet var UsOverTheLineR3 : UITextView
    @IBOutlet var UsR3Game1 : UITextView
    @IBOutlet var UsR3Game2 : UITextView
    @IBOutlet var UsR3Game3 : UITextView
    @IBOutlet var ThemOverTheLineR3 : UITextView
    @IBOutlet var ThemR3Game1 : UITextView
    @IBOutlet var ThemR3Game2 : UITextView
    @IBOutlet var ThemR3Game3 : UITextView
    
    
    var overTheLine:Int = 0
    var underTheLine:Int = 0
    var currentGameNumb:Int = 1
    var currentRubberNumb:Int = 1
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
        switch(currentRubberNumb){
        case(1):
            currentTeam!.overTheLineTextR1 += "\n\(overTheLine)"
            switch(currentGameNumb){
            case(1):
                currentTeam!.game1R1Text += "\n\(underTheLine)"
            case(2):
                currentTeam!.game2R1Text += "\n\(underTheLine)"
            case(3):
                currentTeam!.game3R1Text += "\n\(underTheLine)"
            default:
                break
            }
        case(2):
            currentTeam!.overTheLineTextR2 += "\n\(overTheLine)"
            switch(currentGameNumb){
            case(1):
                currentTeam!.game1R2Text += "\n\(underTheLine)"
            case(2):
                currentTeam!.game2R2Text += "\n\(underTheLine)"
            case(3):
                currentTeam!.game3R2Text += "\n\(underTheLine)"
            default:
                break
            }
        case(3):
            currentTeam!.overTheLineTextR2 += "\n\(overTheLine)"
            switch(currentGameNumb){
            case(1):
                currentTeam!.game1R3Text += "\n\(underTheLine)"
            case(2):
                currentTeam!.game2R3Text += "\n\(underTheLine)"
            case(3):
                currentTeam!.game3R3Text += "\n\(underTheLine)"
            default:
                break
            }
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
                currentRubberNumb++
                currentGameNumb = 1
            }
        }
        (self.tabBarController as Root).newHand()
        
    }
    func resetScores(){
        UsOverTheLineR1.text = game!.teamNS!.overTheLineTextR1
        UsR1Game1.text = game!.teamNS!.game1R1Text
        UsR1Game2.text = game!.teamNS!.game2R1Text
        UsR1Game3.text = game!.teamNS!.game3R1Text
        ThemOverTheLineR1.text = game!.teamWE!.overTheLineTextR1
        ThemR1Game1.text = game!.teamWE!.game1R1Text
        ThemR1Game2.text = game!.teamWE!.game2R1Text
        ThemR1Game3.text = game!.teamWE!.game3R1Text
        UsOverTheLineR2.text = game!.teamNS!.overTheLineTextR2
        UsR2Game1.text = game!.teamNS!.game1R2Text
        UsR2Game2.text = game!.teamNS!.game2R2Text
        UsR2Game3.text = game!.teamNS!.game3R2Text
        ThemOverTheLineR2.text = game!.teamWE!.overTheLineTextR2
        ThemR2Game1.text = game!.teamWE!.game1R2Text
        ThemR2Game2.text = game!.teamWE!.game2R2Text
        ThemR2Game3.text = game!.teamWE!.game3R2Text
        UsOverTheLineR3.text = game!.teamNS!.overTheLineTextR3
        UsR3Game1.text = game!.teamNS!.game1R3Text
        UsR3Game2.text = game!.teamNS!.game2R3Text
        UsR3Game3.text = game!.teamNS!.game3R3Text
        ThemOverTheLineR3.text = game!.teamWE!.overTheLineTextR3
        ThemR3Game1.text = game!.teamWE!.game1R3Text
        ThemR3Game2.text = game!.teamWE!.game2R3Text
        ThemR3Game3.text = game!.teamWE!.game3R3Text
    }
    
}

