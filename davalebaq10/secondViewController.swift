//
//  secondViewController.swift
//  davalebaq10
//
//  Created by Tazo Japaridze on 4/28/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var weight: UILabel!
    var finalprice = ""
    var finalweight="" 
    override func viewDidLoad() {
        price.text="დამატებული პროდუქტების საერთო ფასია: "+finalprice+" ლარი"
        weight.text="დამატებული პროდუქტების საერთო წონაა: "+finalweight+" კილოგრამი"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
