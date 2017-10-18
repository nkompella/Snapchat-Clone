//
//  ImageTableViewController.swift
//  Snapchat Clone
//
//  Created by Neha Kompella on 10/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet var readBit: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var postTime: UILabel!
    var imageLink:UIImage?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
