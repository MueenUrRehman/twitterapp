//
//  hashtagTableViewCell.swift
//  InstagramApp
//
//  Created by mueen on 04/05/2020.
//  Copyright © 2020 mueen. All rights reserved.
//

import UIKit

class hashtagTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newtagLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
      /*  newtagLabel.backgroundColor = UIColor.init(white: 255/255, alpha: 1)
        newtagLabel.tintColor = UIColor.black*/

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
