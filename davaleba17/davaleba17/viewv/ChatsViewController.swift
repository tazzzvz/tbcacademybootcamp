//
//  ChatsViewController.swift
//  davaleba17
//
//  Created by Tazo Japaridze on 5/7/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

struct new_message {
    var message : String
    var number : String
    
}

class ChatsViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
           UDManager.secondbar()
       }
    
    @IBOutlet weak var tableview: UITableView!
    var messagesarray=[new_message]()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        tableview.rowHeight=90

      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendmessage(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "segue", sender: nil)
       
        
    }
    var nametext=""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "second_segue"{
            if let vc=segue.destination as? fullmessageViewController{
               // vc.fullmessage.text   = indexpath.row :/
            }
        }
        if let id = segue.identifier, id == "segue"{
            if let vc=segue.destination as? newmessageViewController{
                vc.delegate=self
            }
        }
    }
    
    
 
    @objc func tapgesture(){
       
        self.performSegue(withIdentifier: "second_segue", sender: nil)

    }
    
   
    
    var inx : Int = 0

}

extension ChatsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesarray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableview.dequeueReusableCell(withIdentifier: "chat_cell", for: indexPath) as! chatTableViewCell
        cell.number.text=messagesarray[indexPath.row].message
        cell.message.text=messagesarray[indexPath.row].number
        cell.isUserInteractionEnabled=true
      let tapgesture=UITapGestureRecognizer(target: self, action: #selector(self.tapgesture))
       cell.addGestureRecognizer(tapgesture)
//        cell.tag = indexPath.row
//        print(cell.tag)
        
        
        
        return cell
                }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "second_segue", sender: nil)
      
        
        
        
    }
    
   
 
    

    
}
extension   ChatsViewController :UITableViewDelegate{
    
}
extension ChatsViewController:addmessagedelegate    {
    func addmessage(new_message: new_message) {
        print("gamovidamgoni")
        self.messagesarray.append(new_message)
        self.tableview.reloadData()
        
    }
    
    
    
}
