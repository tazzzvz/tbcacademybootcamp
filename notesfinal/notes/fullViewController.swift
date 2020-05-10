//
//  fullViewController.swift
//  notes
//
//  Created by Tazo Japaridze on 5/10/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class fullViewController: UIViewController,thirdprotocol {
    func sendseconddata(text2: String, index: Int) {
        
    }
    var delegate4 :thirdprotocol?
    var a = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        fulllabel.text=a
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var fulllabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinat
     ion.
        // Pass the selected object to the new view controller.
    }
    */

}
