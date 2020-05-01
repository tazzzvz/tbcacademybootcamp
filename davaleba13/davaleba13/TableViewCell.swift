//
//  TableViewCell.swift
//  davaleba13
//
//  Created by Tazo Japaridze on 5/1/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
