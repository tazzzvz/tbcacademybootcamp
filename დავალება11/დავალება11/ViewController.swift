//
//  ViewController.swift
//  დავალება11
//
//  Created by Tazo Japaridze on 4/29/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    var userss=[users]()
    var sex=0
    @IBOutlet weak var nametextfield: UITextField!
    @IBOutlet weak var lastnametextfield: UITextField!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    
    
    @IBAction func registration(_ sender: UIButton) {
        makeuser()
        nametextfield.text=""
        lastnametextfield.text=""
        emailtextfield.text=""
        
        
        
    
    }
    @IBAction func nextpage(_ sender: Any) {
        performSegue(withIdentifier: "segue_for_secondpage", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier=segue.identifier {
            if  identifier == "segue_for_secondpage"{
                if let destinationvc=segue.destination as? secondViewController{
                    destinationvc._users=self.userss
                }
                
            }
        }
    }
    
    func makeuser(){
        let name=nametextfield.text ?? ""
        let lastname=lastnametextfield.text ?? ""
        let email=emailtextfield.text ?? ""
        let sex=segment.selectedSegmentIndex
        
        
        let user=users(name: name, lastname: lastname, email: email,sex: sex)
        userss.append(user)
        
        
    }
    
    

}


class users{
    
    
    var name:String
    var lastname:String
    var email:String
    var sex:Int
    
    init(name:String,lastname:String,email:String,sex:Int) {
        self.name=name
        self.lastname=lastname
        self.email=email
        self.sex=sex
        
    }
}


