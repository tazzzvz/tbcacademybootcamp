//
//  addNoteViewController.swift
//  NNotes
//
//  Created by Tazo Japaridze on 5/14/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class addNoteViewController: UIViewController {
    var username = ""
    var note:Notes?
    var isEdditing=false
    @IBOutlet weak var inputNote: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
 
    }
//    override func viewWillAppear(_ animated: Bool) {
//           if isEdditing==true{
//                 inputNote.text=note?.note
//
//             }
//
//    }
    @IBAction func SaveNote(_ sender: Any) {
        
      
               
                
                improvedSave()
                print("save")
                inputNote.text=""
              
           
//           else{
//                   let context = AppDelegate.coreDataContainer.viewContext
//
//                   self.note?.note=inputNote.text
//                    print(inputNote.text!)
//                   do{
//                       try context.save()
//                   }catch{}
//                    isEdditing=false
//
//    }
    func updateNote(){
        let context = AppDelegate.coreDataContainer.viewContext
        self.note?.note=inputNote.text
        
        do{
            try context.save()
        }catch{}
        
    }

    }
}
extension addNoteViewController{
     func improvedSave(){
            
            let context = AppDelegate.coreDataContainer.viewContext
        
            let entityDescription = NSEntityDescription.entity(forEntityName: "Notes", in: context)
            let note = Notes(entity: entityDescription!, insertInto: context )
            note.username=self.username
            note.note=self.inputNote.text

             do{
                 try context.save()
                print("save")
              
                
             }
             catch {}
   
         }
    
}
