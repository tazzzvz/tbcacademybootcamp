//
//  ViewController.swift
//  davaleba8.2
//
//  Created by Tazo Japaridze on 4/25/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield1: UITextField!
  
    
    @IBOutlet weak var textfield2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signin(_ sender: Any) {
            let alert=UIAlertController(title: "Alert", message: "incorect details", preferredStyle: .alert)
            let alert2=UIAlertController(title: "Alert", message: "sheitvanet saxeli da paroli", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: { (nil) in
                
                
            }))

        alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { (nil) in
            
            
        }))
            alert.addAction(UIAlertAction(title: "try again", style: .default, handler: { (nil) in
                
                
            }))
            
        if textfield1.text=="" || textfield2.text==""{
            present (alert2,animated: true)
        }
             present(alert,animated: true)
        
        }
    }
    


