//
//  ListCell.swift
//  Parsing
//
//  Created by pras on 7/4/17.
//  Copyright © 2017 omrobbie. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var myImageView : UIImageView!
    @IBOutlet weak var myTitle : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
