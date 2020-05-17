    //
//  SignUpViewController.swift
//  TazZzBooK
//
//  Created by Tazo Japaridze on 5/16/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    
    @IBOutlet weak var image: UIImageView!{
        didSet{
            image.layer.borderColor=UIColor.black.cgColor
            image.layer.borderWidth=2
        }
    }
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    let imagePicker=UIImagePickerController()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround2()
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
              image.isUserInteractionEnabled=true
              image.addGestureRecognizer(tapGesture)


    }
    
    
    @objc func selectImage(){
        imagePicker.delegate=self
        imagePicker.allowsEditing=true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker,animated: true)
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


    @IBAction func signUp(_ sender: Any) {
        improvedSave()
        self.navigationController?.popViewController(animated: true)
        
    }
    

    
}
    
    extension SignUpViewController {
        func hideKeyboardWhenTappedAround2() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)

        }

        @objc func dismissKeyboard2() {
            view.endEditing(true)
        }
        
        func improvedSave(){
              
                          let context = AppDelegate.coreDataContainer.viewContext
              
                          let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: context)
                          let user = User(entity: entityDescription!, insertInto: context )
                          
            user.name=self.name.text
            user.lastname=self.lastname.text
            user.email=self.email.text
            user.password=self.password.text
            user.login=self.username.text
            if let binaryImage = image.image?.pngData(){
            user.photo=binaryImage
                
            }
              
                           do{
                               try context.save()
                              print("save")
              
              
                           }
                           catch {}
              
                       }
     

    }
    extension SignUpViewController{
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             if let image = info[.editedImage] as? UIImage{
                                  self.image.image = image
                                  }
                                  self.dismiss(animated: true)
        }
    }
