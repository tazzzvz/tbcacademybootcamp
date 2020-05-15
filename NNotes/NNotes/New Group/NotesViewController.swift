//
//  NotesViewController.swift
//  NNotes
//
//  Created by Tazo Japaridze on 5/14/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    var username = ""
    var notesarray=[Notes]()
    var note:Notes?
    
   
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        improvedFetch()
        tableview.delegate=self
        tableview.dataSource=self
        tableview.rowHeight=200
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        improvedFetch()
        tableview.reloadData()
       
    }

    @IBAction func addNote(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIds.segue_for_new_note{
            let vc = segue.destination   as? addNoteViewController
            vc?.username=self.username
//            vc?.isEdditing  = true
            vc?.note = self.note
            
        }
        
    }
    
    func deleteNote(note:Notes){
         let context = AppDelegate.coreDataContainer.viewContext
            context.delete(note)
        
    }
}
extension NotesViewController{
    func improvedFetch(){
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request  :NSFetchRequest<Notes>=Notes.fetchRequest()
        
            request.predicate=NSPredicate(format: "%K = %@", "username", "\(username)")
        
        do{
            let result = try context.fetch(request)
            guard let notes = result as? [Notes] else {return}
            self.notesarray    = notes
        }
        catch {}
        
        
        
    }
}
extension NotesViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notesarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        cell.cell.text=notesarray[indexPath.row].note
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") {( a,v,handler) in
            self.deleteNote(note: self.notesarray[indexPath.row ])
            
            self.notesarray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") {( a,v,handler) in
            
            self.note=self.notesarray[indexPath.row]
            self.performSegue(withIdentifier: segueIds.segue_for_new_note, sender: nil)
               }
        
        let config=UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
    
}

