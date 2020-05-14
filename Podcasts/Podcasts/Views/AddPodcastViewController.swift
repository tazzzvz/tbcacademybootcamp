//
//  AddPodcastViewController.swift
//  Podcasts
//
//  Created by Tazo Japaridze on 5/13/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class AddPodcastViewController: UIViewController{
    @IBOutlet weak var titlefield: UITextField!
    
    @IBOutlet weak var contentfield: UITextView!
    @IBOutlet weak var durationPickerView: UIPickerView!
    
    var selectedDuration:String?
    override func viewDidLoad() {
        durationPickerView.delegate=self
        durationPickerView.dataSource=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    var a :Int?


    

    @IBAction func savePodcast(_ sender: Any) {
        
        improvedSave()
        
        
    }
    func fromPickerToMin()->Int{
        let a = self.durationPickerView.selectedRow(inComponent: 0)
        let b = self.durationPickerView.selectedRow(inComponent: 1)
        
        return a*60+b
        
    }
    
}
extension AddPodcastViewController{
    func improvedSave(){
        let context = AppDelegate.coreDataContainer.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Podcast", in: context)
        
        let podcast = Podcast(entity: entityDescription!, insertInto: context )
        
        podcast.title=self.titlefield.text
        podcast.content=self.contentfield.text
        podcast.duration=Float(fromPickerToMin())
        
        
        
        
        do{
            try context.save()
           
        }catch {}
        
        
        
    }
    
}
extension AddPodcastViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         switch component {
               case 0:
                   return 12
               case 1:
                   return 60

               default:
                   return 0
               }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
          return pickerView.frame.size.width/3
      }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) H"
        case 1:
            return "\(row) M"
      
        default:
            return ""
        }
       
      
    
}
}
