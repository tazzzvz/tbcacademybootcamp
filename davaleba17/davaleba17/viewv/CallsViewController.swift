//
//  CallsViewController.swift
//  davaleba17
//
//  Created by Tazo Japaridze on 5/7/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

struct number {
    var number :String
    var country :String
    var date : String
    
}


class CallsViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        UDManager.thirdbar()
        
       }
    
     var ragaca = [
    (number(number:" 599432343", country: "Georgia", date: "12/23")),
    (number(number:" 598232122", country: "Georgia", date: "12/23")),
    (number(number:" 597023123", country: "Georgia", date: "12/23")),
    (number(number:" 598323123", country: "Georgia", date: "12/23")),
    (number(number:" 321312321", country: "Georgia", date: "12/23")),
    (number(number:" 543543543", country: "Usa", date: "12/23")),
    (number(number:" 543534543", country: "Georgia", date: "12/23")),
    (number(number:" 321323424", country: "Georgia", date: "12/23")),
    (number(number:" 423432423", country: "Georgia", date: "12/23")),
    (number(number:" 432423432", country: "Georgia", date: "12/23")),
    (number(number:" 423423432", country: "Georgia", date: "12/23")),
    (number(number:" 423432432", country: "Georgia", date: "12/23"))]
  
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        
        tableview.rowHeight=90

       
    }
    
    
    


}
extension CallsViewController : UITableViewDelegate {
    
}
extension CallsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ragaca.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableview.dequeueReusableCell(withIdentifier: "calls_cell", for: indexPath) as! CallsTableViewCell
        cell.country.text = ragaca[indexPath.row].country
        cell.number.text = ragaca[indexPath.row].number
        cell.date.text = ragaca[indexPath.row].date
               return cell
    }
    
    
}
