//
//  CallsTableViewCell.swift
//  davaleba17
//
//  Created by Tazo Japaridze on 5/7/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class CallsTableViewCell: UITableViewCell {
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
     
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
