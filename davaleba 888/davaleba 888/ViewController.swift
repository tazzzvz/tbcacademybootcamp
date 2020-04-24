//
//  ViewController.swift
//  davaleba 888
//
//  Created by Tazo Japaridze on 4/24/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: Any) {
        let alert=UIAlertController(title: "Alert", message: "incorrect details", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: { (nil) in
            
            
        }))
        alert.addAction(UIAlertAction(title: "try again", style: .default, handler: { (nil) in
            
            
        }))
        
        present(alert,animated: true)
    }
    
    
    



}
