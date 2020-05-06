//
//  signupViewController.swift
//  davaleba16
//
//  Created by Tazo Japaridze on 5/6/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class signupViewController: UIViewController {

    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
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
    @IBAction func signup(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        udmanager.savelogin(value: "\(String(describing: email.text))")
        
    }

}
