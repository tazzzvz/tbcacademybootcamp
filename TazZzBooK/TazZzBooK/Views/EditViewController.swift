//
//  EditViewController.swift
//  TazZzBooK
//
//  Created by Tazo Japaridze on 5/18/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var user:User?
    @IBOutlet weak var image: UIImageView!{
        didSet{
            image.layer.borderColor=UIColor.black.cgColor
            image.layer.borderWidth=2
        }
    }
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let imagePicker=UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = tabBarController as! TabBarViewController
        user=tabbar.user
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        image.isUserInteractionEnabled=true
        image.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    @objc func selectImage(){
        imagePicker.delegate=self
        imagePicker.allowsEditing=true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker,animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onSave(_ sender: Any) {
     
    }
    func update(){
        let context = AppDelegate.coreDataContainer.viewContext
        let fetchrequest : NSFetchRequest<User> = User.fetchRequest()
        fetchrequest.predicate=NSPredicate(format: "%K = %@", "login", "\(user?.login)")
        
        do{
            let result = try context.fetch(fetchrequest)
            guard let user = result as? [User] else {return}
//            მოკლედ აქ ვიპოვე ეს იუზერი და <<<error type>>> ამას მიწერს თორე მგონი ჩავამთავრებდი ამ დაედითებას
//            user.setvalue ...
            
            
        }
        catch{}
        
        
    }
}
extension EditViewController{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.image.image = image
            
        }
        self.dismiss(animated: true)
    }
}
