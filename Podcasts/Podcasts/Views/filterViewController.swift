//
//  filterViewController.swift
//  Podcasts
//
//  Created by Tazo Japaridze on 5/14/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
protocol filter {
    func sendfilter(time:Double)
}

class filterViewController: UIViewController {
   
    @IBOutlet weak var duration: UITextField!
    var delegate : filter?
    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Do any additional setup after loading the view.
    }
    func split(name:String)->Double{
        let time = name
        let a = time.split(separator: ":")
        let b=Int(a[0])
        let d=b!*60
        let c=Int(a[1])
        let final=d+c!
        return Double(final)
    }
    
    @IBAction func filter(_ sender: UIButton) {
        if duration.text != ""{
        
        let a = duration.text!
        let b = split(name: a)
        print("naang")
        print(b)
        delegate?.sendfilter(time: b)
            self.navigationController?.popViewController(animated: true)}
        
    }
    
    
    
   

}
