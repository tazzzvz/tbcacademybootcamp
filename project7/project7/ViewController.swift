//
//  ViewController.swift
//  project7
//
//  Created by Tazo Japaridze on 4/23/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var var1: UITextField!
    @IBOutlet weak var var2: UITextField!
    @IBOutlet weak var label: UILabel!
 
    
    @IBOutlet weak var segmentt: UISegmentedControl!
    @IBAction func segment(_ sender: UISegmentedControl) {
        
    }
    
    @IBOutlet weak var sliderr: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        label.font=label.font.withSize(CGFloat( Int(sender.value)))
    }
    
    
    @IBAction func button(_ sender: UIButton) {
        
        
        let first = Double(var1.text!)
        let second = Double(var2.text!)
        if segmentt.selectedSegmentIndex==3 && second==0{
            label.text="can't divide by zero"
        }
        else  {
        var ans:Double=0
        if segmentt.selectedSegmentIndex == 0{
            ans=first!+second!
        }
        else if segmentt.selectedSegmentIndex == 1{
            ans=first!-second!
        }
        else if segmentt.selectedSegmentIndex == 2{
            ans=first!*second!
        }
        else if segmentt.selectedSegmentIndex == 3{
            if second! == 0 {
                label.text="can't divide by zero"
            }
            else{
                ans=first!/second!}
        }
            
        label.text="\(ans)"
       
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        var1.keyboardType=UIKeyboardType.numberPad
        var2.keyboardType=UIKeyboardType.numberPad


                // Do any additional setup after loading the view.
    }
    

}

