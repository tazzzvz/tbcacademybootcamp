//
//  ViewController.swift
//  davaleba16
//
//  Created by Tazo Japaridze on 5/6/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernametextfield: UITextField!
    
    @IBOutlet weak var passwordtextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        print(udmanager.getlogin())
        
     //   UserDefaults.standard.set("\(String(describing: passwordtextfield.text))", forKey: "text")
        print(udmanager.isloggedin())
        
        
        if udmanager.isloggedin(){
            performSegue(withIdentifier: "home_page_segue", sender: nil)
            print("egaaa")
        }
        
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        // Do any additional setup after loading the view.
        
        
        print("glav")
       
        
        
        
    }

    @IBAction func loginbutton(_ sender: UIButton) {
//        print(udmanager.getlogin())
//
//        print(usernametextfield.text ?? "")
//        print("gamotoveba")
     //  print(udmanager.getlogin())
        
        
        let login = udmanager.getlogin()
        
       
        let a = usernametextfield.text!
       
      //  if let value = UserDefaults.standard.string(forKey: "language") {
                 //  print("Before: \(value)")
        performSegue(withIdentifier: "home_page_segue", sender: sender)
        
          
      
       
    }
    
    @IBAction func signupbutton(_ sender: Any) {
        
        
        performSegue(withIdentifier: "Sign_up_segue", sender: sender)
               udmanager.savename(value: "\(String(describing: usernametextfield.text))")
        
                print(udmanager.getname())
    }
}

