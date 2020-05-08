//
//  chatTableViewCell.swift
//  davaleba17
//
//  Created by Tazo Japaridze on 5/7/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class chatTableViewCell: UITableViewCell {

    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var image_t: UIImageView!
    
    @IBOutlet weak var number: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        image_t.layer.cornerRadius=60
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
