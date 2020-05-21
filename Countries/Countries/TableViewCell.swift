//
//  TableViewCell.swift
//  Countries
//
//  Created by Tazo Japaridze on 5/21/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var borders: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
