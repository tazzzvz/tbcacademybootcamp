//
//  secondViewController.swift
//  დავალება11
//
//  Created by Tazo Japaridze on 4/29/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
   
    var _users=[users]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        tableview.delegate=self
        tableview.dataSource=self
        
        super.viewDidLoad()
        for i in _users{
            print(i.name)
            print(i.lastname)
        }

        // Do any additional setup after loading the view.
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
extension secondViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellidentifier", for: indexPath) as! tableviewcellTableViewCell
        
        cell.name.text=_users[indexPath.row].name
        cell.lastname.text=_users[indexPath.row].lastname
        if _users[indexPath.row].sex==0{
            cell.sex.text="სქესი : კაცი"
        }
        else{
            cell.sex.text="სქესი : ქალი"
        }
        cell.email.text="email : "+_users[indexPath.row].email
        
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print(indexPath.row)
    }
    
    
    
    
    
    
}
