//
//  Team.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/17/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class Team: NSObject {
    var player1:Player?
    var player2:Player?
    var rubbersWon:Int = 0
    var gamesWon:Int = 0
    var vulnerable:Bool = false
    var isCurrentTeam:Bool = false
    var totalPoints:Int = 0
    var currentUnderPoints:Int = 0
    var overTheLineText:String = ""
    var game1Text:String = ""
    var game2Text:String = ""
    var game3Text:String = ""
    init(player1:Player!, player2:Player!){
        self.player1 = player1
        self.player2 = player2
    }
}
