//
//  ViewController.swift
//  Podcasts
//
//  Created by Tazo Japaridze on 5/13/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData
protocol detailprotocol {
    func detailfunc(title:String,content:String,duration:String)
}
class ViewController: UIViewController ,filter{
   
    
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        tableview.rowHeight=150
        
        
        // Do any additional setup after loading the view.
    }
    var delegate:detailprotocol?
    @IBAction func filterbutton(_ sender: Any) {

      
        guard let vc = storyboard?.instantiateViewController(identifier: "filter") as? filterViewController    else{return}
        vc.delegate=self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: segueIds.segue_for_new_podcast, sender: nil)
        
    }
    
    @IBAction func filter(_ sender: UIBarButtonItem) {
        
         
    }
    var arr=[Podcast]()
    var filteredtime = 10000000.0
    
    func sendfilter(time: Double) {
          filteredtime=time
        print(filteredtime)
       }
}

extension ViewController {
    
    func improvedSave(titleeee:String,content:String,duration:String){
        let context = AppDelegate.coreDataContainer.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Podcast", in: context)
        
        let podcast = Podcast(entity: entityDescription!, insertInto: context )
        
        podcast.title=titleeee
        
        do{
            try context.save()
            
        }catch {}
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        improvedFetch()
        tableview.reloadData()
       
      }
    
   
    
    func improvedFetch(){
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request  :NSFetchRequest<Podcast>=Podcast.fetchRequest()
        print("gapiltrulia")
        print(filteredtime)
         request.predicate=NSPredicate(format: "%K < %@", "duration", "\(filteredtime)")
        
        do{
            let result = try context.fetch(request)
            guard let podcasts = result as? [Podcast] else {return}
            self.arr    = podcasts
        }
        catch {}
        
        
        
    }
    func mintohour(name:Float)->String{
        let a = Int(name)
        let b = a/60
        let c = a%60
        if c<10{
            return "\(String(b)):0\(String(c))"}
        else {return ""}
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.content.text=arr[indexPath.row].content
        cell.title.text=arr[indexPath.row].title
        cell.duration.text=mintohour(name: arr[indexPath.row].duration)
        
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController    else{return}
        vc.title12=arr[indexPath.row].title!
        vc.content=arr[indexPath.row].content!
        vc.duration=mintohour(name: arr[indexPath.row].duration)
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
}

