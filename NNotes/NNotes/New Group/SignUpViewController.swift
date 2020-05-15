//
//  SignUpViewController.swift
//  NNotes
//
//  Created by Tazo Japaridze on 5/14/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    var registeredUsersArray=[Users]()
    override func viewDidLoad() {
        super.viewDidLoad()
        improvedFetch()
        print(registeredUsersArray.count)
    }
    
    @IBAction func signUp(_ sender: Any) {
        var testarray=[String]()
        for i in registeredUsersArray{
            testarray.append(i.username!)}
            
        if testarray.contains(username.text!){alert()}
        else{
        if username.text == "" || password.text==""{
            let alert=UIAlertController(title: "Pleas fill out all fields", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true)}
        else
        {
        improvedSave()
        self.dismiss(animated: true)
            
        }
        
        }}
    func alert(){
        let alert=UIAlertController(title: "This Username already Exist", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true)
    }
    
    func improvedSave(){
        
        let context = AppDelegate.coreDataContainer.viewContext
    
        let entityDescription = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let user = Users(entity: entityDescription!, insertInto: context )

        user.username=username.text
        user.password=password.text

    
         do{
             try context.save()
            
         }catch {}
     }
}
extension SignUpViewController {
    func improvedFetch(){
            let context = AppDelegate.coreDataContainer.viewContext
            
            let request  :NSFetchRequest<Users>=Users.fetchRequest()
            do{
                let result = try context.fetch(request)
                guard let userss = result as? [Users] else {return}
                self.registeredUsersArray    = userss
            }
            catch {}
        }
}
