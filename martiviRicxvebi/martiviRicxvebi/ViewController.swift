//
//  ViewController.swift
//  martiviRicxvebi
//
//  Created by Tazo Japaridze on 5/27/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    
    @IBAction func onButton(_ sender: Any) {
       button.isEnabled=false
       DispatchQueue.global(qos: .background).async {
//        self.button.isEnabled=false
            for i in 2...100000 {
                         if self.isPrime(i) {
                                   print(i)
                               }
        }
       
        }
         

    }
    func isPrime(_ num: Int) -> Bool {
     let max = Int(floor(sqrt(Double(num))))
     guard max >= 2 else { return true }

     for factor in 2...max {
         if num.isMultiple(of: factor) { // Write num % factor == 0 for older versions of Swift
             return false
         }
     }

     return true
 }
    


}

