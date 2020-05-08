//
//  newmessageViewController.swift
//  davaleba17
//
//  Created by Tazo Japaridze on 5/7/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

protocol addmessagedelegate{
    func addmessage(new_message:new_message)
}

class newmessageViewController: UIViewController {
    
    
    var delegate : addmessagedelegate?

    @IBOutlet weak var messagetextfield: UITextView!
    @IBOutlet weak var numberfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func savebutton(_ sender: Any) {
        print("zzz")
        
        guard let number = numberfield.text, numberfield.hasText, let message = messagetextfield.text, messagetextfield.hasText else{
            print("sheiyvanet nomeri da teksti")
            return
            
        }
        
        
        let msgdetails=new_message(message: number, number: message)
        
        delegate?.addmessage(new_message:msgdetails)
        self.dismiss(animated: true, completion: nil)
        print("zzzzz")
//        self.navigationController?.pushViewController(ChatsViewController(), animated: true)
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
