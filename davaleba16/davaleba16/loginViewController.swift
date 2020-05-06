//
//  loginViewController.swift
//  davaleba16
//
//  Created by Tazo Japaridze on 5/6/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    override func viewDidLoad() {
        print(
        "tz")
        super.viewDidLoad()
        udmanager.logedin()
        self.navigationItem.hidesBackButton=true
        text.text=udmanager.gettext()
        if udmanager.darkmodeon(){
            view.backgroundColor = .black
        }
        else{
            view.backgroundColor = .white
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOut(_ sender: UIBarButtonItem) {
        udmanager.offloggedin()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func cleartext(_ sender: Any) {
        text.text=""
    }
    
    @IBAction func darkmode(_ sender: UIButton) {
        print("tzzzzzzz")
        
        if udmanager.darkmodeon(){
            view.backgroundColor = .white
            udmanager.darkomodeoff()
        }
        else{
            view.backgroundColor = .darkGray
            udmanager.darkmode()
        }
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        udmanager.savetext(value: "\(String(describing: text.text))")
        
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
