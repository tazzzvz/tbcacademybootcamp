//
//  ViewController.swift
//  davaleba9
//
//  Created by Tazo Japaridze on 4/27/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Name: UITextField!
    var _name = ""
    @IBOutlet weak var Lastname: UITextField!
    var _lastname=""
    @IBOutlet weak var Email: UITextField!
    var _email=""
    @IBOutlet weak var Mobile: UITextField!
    var _mobile=""
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signup(_ sender: Any) {
        self._name=Name.text!
        self._lastname=Lastname.text!
        self._email=Email.text!
        self._mobile=Mobile.text!
        
    performSegue(withIdentifier: "seguename", sender: nil)
        
    
    
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController2
        vc.finalname=self._name
        vc.finallastname=self._lastname
        vc.finalemail=self._email
        vc.finalmobile=self._mobile
        
        
       
        
        
    }
    
}

