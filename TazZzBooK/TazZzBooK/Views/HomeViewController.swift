//
//  HomeViewController.swift
//  TazZzBooK
//
//  Created by Tazo Japaridze on 5/17/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate   {

    @IBOutlet weak var tableview: UITableView!
    var postsArray=[Post]()
    
    var user :User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate=self
        tableview.dataSource=self
//        tableview.register(MyTableViewCell.self, forCellReuseIdentifier: "celll")
        let tabbar = tabBarController as! TabBarViewController
        user=tabbar.user
        tableview.rowHeight=200
       
        
        
        
 
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        improvedFetch()
        tableview.reloadData()
        print( postsArray.count)
    }
    @objc func new_post(){
        
    }
    @IBAction func onNewPost(_ sender: Any) {
        let newPostVc=storyboard?.instantiateViewController(identifier: "new_post") as! NewPostViewController
        newPostVc.user=self.user
               navigationController?.pushViewController(newPostVc, animated: true)
               
    }
    func improvedFetch(){
           let context = AppDelegate.coreDataContainer.viewContext
           
           let request  :NSFetchRequest<Post>=Post.fetchRequest()
           do{
               let result = try context.fetch(request)
               
               
               guard let post = result as? [Post] else {return}
                self.postsArray=post
               
               
           }
           catch {}
           
       }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath) as! MyTableViewCell

        cell.content.text=postsArray[indexPath.row].content
        cell.nameLastname.text="\(postsArray[indexPath.row].user!.name!)  \((postsArray[indexPath.row].user!.lastname!))"
        cell.date.text=postsArray[indexPath.row].date
        if let binaryData = (postsArray[indexPath.row].user?.photo){
            cell.imageView?.image=UIImage(data: binaryData)
        }
 

        return cell
    }

}
