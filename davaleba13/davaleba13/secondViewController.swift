//
//  secondViewController.swift
//  davaleba13
//
//  Created by Tazo Japaridze on 5/1/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

struct car{
    
    var model:String
    var price:String
    var image:Int
   
    
}

protocol cardelegate {
    func passcar(car :car)
}

class secondViewController: UIViewController {
    
 
    @IBOutlet weak var tableview2: UITableView!
    
    @IBOutlet weak var modeltextfield: UITextField!
    @IBOutlet weak var pricetextfield: UITextField!
    var cardelegateee:cardelegate!
    var ragaca:car?
    override func viewDidLoad() {
        tableview2.delegate=self
        tableview2.dataSource=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func tofirstpage(_ sender: UIButton) {
        let rnd=Int.random(in: 0...4)
      
        
        let newcar=car(model: modeltextfield.text!, price: pricetextfield.text!,image: rnd)
        
        //mankanis suratebs randomad irchevs imitom rom sxvanairad ver movipiqre titqos indexpathrowti
        //vcdilobdi magram ver vnaxe versad rogor gadamewodebina ras airchevda momxarebeli an rogor unda mimxvdariyo programa romels arichevda tu surats magalitad shuashi gaacherebda ))
        
        cardelegateee.passcar(car: newcar)
        
        
        modeltextfield.text=""
        pricetextfield.text=""
        
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
var carsarray=["bmw","audi","mercedes","ford","download"]
extension secondViewController :  UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carsarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview2.dequeueReusableCell(withIdentifier: "new_cell2", for: indexPath) as! TableViewCell2
        
        cell.image2.image=UIImage(named: carsarray[indexPath.row])
            
        return cell
        
        
    }
    
    
}
extension secondViewController : UITableViewDelegate{
    
}
