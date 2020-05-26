//
//  SecondViewController.swift
//  Notificanion
//
//  Created by Tazo Japaridze on 5/22/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var iosImage: UIImageView!
    @IBOutlet weak var androidImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        iosImage.isUserInteractionEnabled=true
        androidImage.isUserInteractionEnabled=true
        
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(iosSelected))
        iosImage.addGestureRecognizer(tapGesture)
        let tapGesture1=UITapGestureRecognizer(target: self, action: #selector(androidSelected))
        androidImage.addGestureRecognizer(tapGesture1)
        

        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func iosSelected(){
        let name = Notification.Name(rawValue: iosNotificanion )
        NotificationCenter.default.post(name: name, object: nil)
        navigationController?.popViewController(animated: true)

    }
    @objc func androidSelected(){
        let name = Notification.Name(rawValue: andoridNotificaniton )
        NotificationCenter.default.post(name: name, object: nil)
        navigationController?.popViewController(animated: true)
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
