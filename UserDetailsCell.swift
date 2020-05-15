//
//  UserDetailsCell.swift
//  InstagramApp
//
//  Created by mueen on 30/04/2020.
//  Copyright © 2020 mueen. All rights reserved.
//

import UIKit

class UserDetailsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    @IBOutlet weak var personImage: UIImageView!
    
    
    
    
    /*@IBOutlet weak var followers1Label: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var following1Label: UILabel!*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
            
        /*nameLabel.backgroundColor = UIColor.init(white: 255/255, alpha: 1)
        nameLabel.tintColor = UIColor.black

        followersLabel.backgroundColor = UIColor.init(white: 255/255, alpha: 1)
        followersLabel.tintColor = UIColor.black
        */
        
       /* followers1Label.backgroundColor = UIColor.init(white: 255/255, alpha: 1)
        followers1Label.tintColor = UIColor.black
        
        
        following1Label.backgroundColor = UIColor.init(white: 255/255, alpha: 1)
        following1Label.tintColor = UIColor.black
        
        followingLabel.backgroundColor = UIColor.init(white: 255/255, alpha: 1)
        followingLabel.tintColor = UIColor.black
*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
