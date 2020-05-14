//
//  filteredViewController.swift
//  Podcasts
//
//  Created by Tazo Japaridze on 5/14/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class gapuchebuliview: UIViewController {
    var filteredarr=[Podcast]()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           improvedFetch2()
           tableview.reloadData()
         }

   

}
extension gapuchebuliview:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.content.text=filteredarr[indexPath.row].content
        cell.title.text=filteredarr[indexPath.row].title
       cell.duration.text=String(filteredarr[indexPath.row].duration)
        
        return cell
    }
    
    
}
extension gapuchebuliview{
    func improvedFetch2(){
            let context = AppDelegate.coreDataContainer.viewContext
           
            let request  :NSFetchRequest<Podcast>=Podcast.fetchRequest()
            

            request.predicate=NSPredicate(format: "%K > %@", "duration", "-1")
           
            do{
               let result = try context.fetch(request)
               guard let podcasts = result as? [Podcast] else {return}
            self.filteredarr    = podcasts
                print(podcasts)
            }
            catch {}
           
           
           
       }

}
