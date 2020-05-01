//
//  ViewController.swift
//  davaleba13
//
//  Created by Tazo Japaridze on 5/1/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tableview: UITableView!
    var mankanebi=[car]()
    var carfromsecond:car?
    override func viewDidLoad() {
        tableview.estimatedRowHeight=44
        tableview.rowHeight=200// saat naxevari mainc vcdilobdi magali yopiliyo es row da sxvanairad ver gavzarde :/
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func scrolldown(_ sender: UIButton) {if mankanebi.count>0{
        let indexPath=IndexPath(row: mankanebi.count-1, section: 0)
            tableview.scrollToRow(at: indexPath, at: .bottom, animated: true)}
    }
    @IBAction func scorllup(_ sender: UIButton) {
        if mankanebi.count>0{
        let indexPath=IndexPath(row: 0, section: 0)
            tableview.scrollToRow(at: indexPath, at: .top, animated: true)}
    }
    @IBAction func nextpage(_ sender: UIBarButtonItem) {
        let storyBoard=UIStoryboard(name: "Main", bundle: nil)
        let newVc=storyBoard.instantiateViewController(withIdentifier: "second_view" )
        if let unwrappedvc=newVc as? secondViewController{
            unwrappedvc.cardelegateee=self
            unwrappedvc.ragaca=self.carfromsecond
            
            
        }
        
        self.navigationController?.pushViewController(newVc, animated: true)

       
    }
  
    
}
extension ViewController:cardelegate{
    
    func passcar(car :car){
        print("tz")
        mankanebi.append(car)
        tableview.reloadData()
        
    }
    
    
}
extension ViewController :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mankanebi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "new_cell", for: indexPath) as! TableViewCell
        cell.model.text=mankanebi[indexPath.row].model
        cell.price.text=mankanebi[indexPath.row].price
        let x=mankanebi[indexPath.row].image
        cell.image1.image=UIImage(named: "\(carsarray[x])")
            return cell
    
        
        
    }
    
    
}
extension ViewController :UITableViewDelegate{
    
}
