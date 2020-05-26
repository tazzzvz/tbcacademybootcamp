//
//  ViewController.swift
//  Notificanion
//
//  Created by Tazo Japaridze on 5/22/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
let iosNotificanion="iosNotificanion"
let andoridNotificaniton="andoridNotificaniton"
class ViewController: UIViewController {

    @IBOutlet weak var iosVsAndroid: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    let ios = Notification.Name(rawValue: iosNotificanion)
    let android = Notification.Name(rawValue: andoridNotificaniton)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,selector: #selector(didreceiveInformation),name: NSNotification.Name("some_chanel"), object: nil)
        createObserves()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "secondVc") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func didreceiveInformation(with notidication: Notification){
      
    }
    func createObserves(){
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.changeImage(notificaion:)), name: ios, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.changeLabe(notificaion:)), name: ios, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.changeImage(notificaion:)), name: android, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.changeLabe(notificaion:)), name: android, object: nil)
        
        
    }
    @objc func changeImage(notificaion:NSNotification){
        
        let isIos = notificaion.name == ios
        let image = isIos ? UIImage(named: "iOS.jpg")! :UIImage(named: "andorid.png")!
        iosVsAndroid.image=image
        
    }
    @objc func changeLabe(notificaion:NSNotification){
        let isIos = notificaion.name == ios
        let name = isIos ? "Better Choise" : "Nobody Is Perfect"
        textLabel.text=name
        
    }

    
}

extension Notification.Name{
    static let someChanel = NSNotification.Name( "some_chanel")
}

