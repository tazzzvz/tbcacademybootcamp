//
//  MyCollectionViewCell.swift
//  Folders
//
//  Created by Tazo Japaridze on 5/11/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageview :UIImageView!
    static let identifier = "MyCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with image: UIImage){
        imageview.image = image
    }
    
    static func nib()->UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
        
}
}
