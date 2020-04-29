//
//  tableviewcellTableViewCell.swift
//  დავალება11
//
//  Created by Tazo Japaridze on 4/29/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class tableviewcellTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var email: UILabel!
    
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
