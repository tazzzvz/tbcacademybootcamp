//
//  ViewController.swift
//  notes
//
//  Created by Tazo Japaridze on 5/8/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

protocol newprotocol {
    func senddataforsecond(text:String,index:Int)
}
protocol movearrayprotocol {
    func movearray(string:Array<Any>)
}


class ViewController: UIViewController,secondprotocol,thirdprotocol {
  

    @IBOutlet weak var tableview: UITableView!
    
    
    var noteslist = [String]( )
    var delegate2 : newprotocol?
    var delegate :movearrayprotocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        tableview.rowHeight=85
        
     
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("unda waigos")
        delegate?.movearray(string: noteslist)
    }
    
    func getarraycount() {
        noteslist.count
    }
    
//
//        func savedata(){
//
//            print("chawera")
//                let filename = "test"
//                let documentdirurl=try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                let fileUrl=documentdirurl.appendingPathComponent(filename).appendingPathExtension("txt")
//                print(fileUrl.path)
//                for i in 0...noteslist.count{
//                    let WriteString = noteslist[i]
//                    print(i)
//
//                    do {
//                        try WriteString.write(to: fileUrl, atomically: true, encoding: String.Encoding.utf8)
//                    }
//                    catch let error as NSError{
//                        print("ver chavwere")
//                        print(error)
//                    }}
//        }
    
    
    @IBAction func newnote(_ sender: Any) {
        
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        let newVc=storyboard.instantiateViewController(withIdentifier: "new_note")
        if let unwrappedVc=newVc as? secondViewController{
            unwrappedVc.delegatee=self
        }
        newVc.title="New Note"
        self.navigationController?.pushViewController(newVc, animated: true)
        }
    func getsomedata(text: String) {
            noteslist.append(text)
            tableview.reloadData()
           }
//    func editnote(text1:String){
//                print(noteslist.count)
//            }
    func sendseconddata(text2: String, index: Int) {
        noteslist[index]=text2
        tableview.reloadData()
   }
    }
extension ViewController:UITableViewDelegate{
}
extension ViewController : UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=noteslist[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(identifier: "finalfull_note") as? fullViewController    else{return}
//        vc.fulllabel.text = self.noteslist[indexPath.row]
        vc.a=self.noteslist[indexPath.row]
       
        vc.title="Edit Note"
        vc.delegate4=self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
       
        let editButton = UITableViewRowAction(style: .normal, title: "Edit", handler: { (rowAction, indexPath) in
            let note = self.noteslist[indexPath.row]
            let notesVC = self.storyboard?.instantiateViewController(withIdentifier: "full_note") as! fullnoteViewController
            notesVC.a = note
            notesVC.delegate3 = self
            self.navigationController?.pushViewController(notesVC, animated: true)
        })
        
        let delteButton = UITableViewRowAction(style: .normal, title: "delete", handler: {(rowAction,index) in
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.noteslist.remove(at: indexPath.row)
            tableView.endUpdates()
            
        })
        delteButton.backgroundColor = .red
    
        return [delteButton,editButton]
    }
        
        


}
