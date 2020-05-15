//
//  ViewController.swift
//  NNotes
//
//  Created by Tazo Japaridze on 5/14/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    var registeredUsers:[Users]=[]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
 
    }
    override func viewWillAppear(_ animated: Bool) {
         improvedFetch()
    }

    @IBAction func logIn(_ sender: Any) {
        var matched = false
        for i in registeredUsers{
            
            if userName.text == i.username && password.text == i.password{
             
                matched=true
            }
            else {}
        }
        if matched{
           performSegue(withIdentifier: segueIds.segue_for_notes, sender: nil)

        }
        
        
        else{
        let alert=UIAlertController(title: "Incorect Username or Password", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true)
           
        }
       
    }
    @IBAction func signUp(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == segueIds.segue_for_notes{
            let vc=segue.destination as? NotesViewController
            vc?.username=self.userName.text!
            
        }
        let backItem = UIBarButtonItem()
                  backItem.title = "Sign Out"
                  navigationItem.backBarButtonItem = backItem
    }
    
}
extension ViewController{
    
    func improvedFetch(){
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request  :NSFetchRequest<Users>=Users.fetchRequest()
        do{
            let result = try context.fetch(request)
            guard let userss = result as? [Users] else {return}
            self.registeredUsers    = userss
        }
        catch {}      
        
    }
}

