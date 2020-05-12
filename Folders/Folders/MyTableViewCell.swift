//
//  MyTableViewCell.swift
//  Folders
//
//  Created by Tazo Japaridze on 5/12/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    var note: Note!{
        didSet{
            
            textlabel.text = note.text
        }
    }
//
    @IBOutlet weak var textlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
