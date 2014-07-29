//
//  DoneBiddingViewController.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/15/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class DoneBiddingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var rootViewController: BidViewController?
    var finalBid:Bid?
    var game:Game?
    @IBOutlet var scoreChoices : UIPickerView
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return 14
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row:Int, forComponent component:Int) -> String {
      
        
        return "\(row - 7)"
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row:Int, inComponent component:Int) {
        var alert:UIAlertController = UIAlertController(title: "Are you sure?", message: "Is this your final score? \(row-7) ", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler:{alert in
            var finalTricks = row - 7
            var scoreController = self.tabBarController.viewControllers[1] as ScoreViewController
            scoreController.calculateScoreWithBid(self.finalBid!, andTricks: finalTricks)
            self.tabBarController.selectedIndex = (1)
            return
            }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {alert  in
    
            return
            
            }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func setFinalBid(bid:Bid){
        finalBid = bid
    }

}
