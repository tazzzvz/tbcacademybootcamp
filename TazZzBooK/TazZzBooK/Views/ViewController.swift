//
//  ViewController.swift
//  TazZzBooK
//
//  Created by Tazo Japaridze on 5/16/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    var registeredUsers = [User]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        print(registeredUsers.count)
        improvedFetch()
         print(registeredUsers.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
       NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       print("tazo\(registeredUsers.count)")


    
    }
    @objc func keyboardWillShow(_ notification:Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }

        @objc func keyboardWillHide(_ notification:Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    
    
    var selecteduser:User?
    @IBAction func logIn(_ sender: UIButton) {
        var matched = false
        
        for i in registeredUsers{
            if i.login==userName.text && i.password==passwordField.text{
                matched=true
                selecteduser=i
            }
        }
        if matched {
            let signUpVc=storyboard?.instantiateViewController(identifier: "tab_bar") as! TabBarViewController
            signUpVc.user=self.selecteduser
            navigationController?.pushViewController(signUpVc, animated: true)
        }
        else{
          let alert=UIAlertController(title: "Incorect Username or Password", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true)
        }
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        let signUpVc=storyboard?.instantiateViewController(identifier: "sign_up") as! SignUpViewController
        navigationController?.pushViewController(signUpVc, animated: true)
        
    }
    
    
    func improvedFetch(){
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request  :NSFetchRequest<User>=User.fetchRequest()
        do{
            let result = try context.fetch(request)
            
            
            guard let user = result as? [User] else {return}
            self.registeredUsers = user
            
            
        }
        catch {}
        
    }
}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

