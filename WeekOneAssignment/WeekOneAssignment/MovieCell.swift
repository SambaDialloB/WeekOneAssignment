//
//  MovieCell.swift
//  WeekOneAssignment
//
//  Created by Samba on 2/4/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var overLabel: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
