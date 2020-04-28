//
//  ViewController.swift
//  davalebaq10
//
//  Created by Tazo Japaridze on 4/28/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit


extension UIViewController{
    func HideKeyboard()   {
         let tap:UITapGestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(DismisKeyboard))
                
                view.addGestureRecognizer(tap)
    }
    @objc func DismisKeyboard()  {
           view.endEditing(true)
       }
}

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
  
    

    @IBOutlet weak var quantitydisplay: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var price: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    var pickerdata=["ბოსტნეული","თხილეული","ბურღულეული","ფხალეული","პროსტაეული"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
          
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
        return pickerdata.count
       
      }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
            return pickerdata[row]
        
    
    }
    var raodenoba=0
    
    var allprice=0
    var totalweight=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate=self
        self.picker.dataSource=self
        
        self.HideKeyboard()
        
        
        // Do any additional setup after loading the view.
    }
   

    @IBAction func add(_ sender: UIButton) {
        if name.text=="" || quantity.text=="" || price.text==""  {
            
            
        }
        else{
        raodenoba=raodenoba+1
        quantitydisplay.text="საერთო რაოდენობა  :"+String(raodenoba)
        let prc = Int(price.text ?? "") ?? 0
        allprice=prc+allprice
        print(allprice)
        let qnt = Int(quantity.text ?? "") ?? 0
        totalweight=totalweight+qnt
          
        self.name.text=""
        self.quantity.text=""
        self.price.text=""
        }
       
    
}
    @IBAction func clear(_ sender: UIButton) {raodenoba=0
        allprice=0
        totalweight=0
        raodenoba=0
        quantitydisplay.text="საერთო რაოდენობა : "+String(raodenoba)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: self)
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc=segue.destination as! secondViewController
        vc.finalprice=String(allprice)
        vc.finalweight=String(totalweight)
        
        
    }

}

