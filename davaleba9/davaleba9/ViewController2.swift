//
//  ViewController2.swift
//  davaleba9
//
//  Created by Tazo Japaridze on 4/27/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    var finalname=""
    
    @IBOutlet weak var Lastname: UILabel!
    var finallastname=""
    @IBOutlet weak var email: UILabel!
    var finalemail=""
    @IBOutlet weak var mobile: UILabel!
    var finalmobile=""
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
        name.text = finalname
        Lastname.text=finallastname
        email.text=finalemail
        mobile.text=finalmobile
        

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
