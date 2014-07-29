//
//  BidTableViewCell.swift
//  BridgeGame4
//
//  Created by Paul Haefliger on 7/11/14.
//  Copyright (c) 2014 Paul Haefliger. All rights reserved.
//

import UIKit

class BidTableViewCell: UITableViewCell {
    @IBOutlet var suitImage: UIImageView
    @IBOutlet var numbLabel: UILabel
    var suitName: String = ""
    var numbName: String = ""
    
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
