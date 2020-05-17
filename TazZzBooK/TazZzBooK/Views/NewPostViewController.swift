//
//  NewPostViewController.swift
//  TazZzBooK
//
//  Created by Tazo Japaridze on 5/17/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class NewPostViewController: UIViewController {
    var user:User?
    let date=Date()
    
    let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .none)
  
    @IBOutlet weak var postTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
       

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onSavePost(_ sender: Any) {
       improvedSave()
        print("post Saved")
        navigationController?.popViewController(animated: true)
  
    }
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func improvedSave(){
                  
            let context = AppDelegate.coreDataContainer.viewContext
                  
            let entityDescription = NSEntityDescription.entity(forEntityName: "Post", in: context)
            let post = Post(entity: entityDescription!, insertInto: context )
                              
        post.content=postTextField.text
        post.user=user
        post.date=self.timestamp
        print(user!.lastname!)
        
                  
        do{
            try context.save()
            }
        catch {}
                  
    }
}

