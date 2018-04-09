//
//  CustomTableViewCell.swift
//  project2
//
//  Created by Nhu Nguyet  on 3/30/18.
//  Copyright © 2018 Nhu Nguyet . All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var lblText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
