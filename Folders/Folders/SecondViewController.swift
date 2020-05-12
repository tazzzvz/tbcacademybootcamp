//
//  SecondViewController.swift
//  Folders
//
//  Created by Tazo Japaridze on 5/12/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var notesarray = [Note]()
    override func viewDidLoad() {
    
        
        super.viewDidLoad()

        tableview.delegate=self
        tableview.dataSource=self
//        tableView.rowHeight = 85
        tableview.reloadData()
        readnotes()
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        readnotes()
//        tableview.reloadData()
//
//    }
    
    func deletenote(url:URL){
        let fm=FileManager.default
        do{
            try fm.removeItem(at: url)
        }
        catch let err {print(err.localizedDescription)}
    }
    
    private func readnotes(){
        self.notesarray.removeAll()
        let fm = FileManager.default
        
        let docurl = try! fm.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        let arr = try! fm.contentsOfDirectory(at: docurl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        print(arr.count)
        for p in arr where p.pathExtension == "txt"{
            print(try! String(contentsOf: p))
            self.notesarray.append(Note(url: docurl))
            
        
        }
        
        
        self.tableview.reloadData()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == segueIds.Segue_for_third_page{
            if let updatevc=segue.destination as? ThirdViewController {
                updatevc.createupdatedelegate=self
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func AddNote(_ sender: Any) {
        performSegue(withIdentifier:segueIds.Segue_for_third_page, sender: nil)
    }
}


extension SecondViewController:UITableViewDataSource{
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesarray.count
              
    }
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "note_cell", for: indexPath) as! MyTableViewCell
      cell.textlabel.text=notesarray[indexPath.row].text
//       cell.note=notesarray[indexPath.row].text
        return cell
    }
    
    
}
extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "edit" ){(a, v, handler) in
            
        }
        let delete = UIContextualAction(style: .destructive, title: "delete" ){(a, v, handler) in
            
            self.deletenote(url: self.notesarray[indexPath.row].url)
            self.notesarray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            print(self.notesarray.count)
            
              }
        
        
        
        
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
}
extension SecondViewController  :CreateUpdatePageDelegate{
    func shouldReloadTableviewData() {
        readnotes()
        
    }
    
    func noteDidUpdated() {
        
    }
    
    
}






struct Note {
    
    
    var url: URL
    
    var text: String {
       
            return "try! String(contentsOf: url)"
        
        
    }
  
}

