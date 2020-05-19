//
//  SecondViewController.swift
//  api
//
//  Created by Tazo Japaridze on 5/19/20.
//  Copyright © 2020 Tbc. All rights reserved.
//
struct Songsrespone:Codable {
    let data : [Song]
}

struct Song:Codable {
    let band:String
    let songs:[ragaca]
    struct ragaca:Codable {
        let title:String
    }
}

import UIKit

class SecondViewController: UIViewController {
    var songs = [Song]()
    var artist:String!
    var info  :String!
    var filteredSongs = [Song.ragaca]()
    @IBOutlet weak var infoLabel: UILabel!
   
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = artist
        get()
        tableview.delegate=self
        tableview.dataSource=self
        infoLabel.text=info
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func get(){
        
        let url = URL(string: "http://www.mocky.io/v2/5ec3ca1c300000e5b039c407")!
        URLSession.shared.dataTask(with:url) { (data, res, err) in
            guard let data=data else {return}
            
            do{
                let decoder = JSONDecoder()
                let SongRespone = try  decoder.decode(Songsrespone.self,from: data)
//                self.groups.append(contentsOf: SongRespone.groups)
//                self.songs.append(contentsOf: son)
                DispatchQueue.main.async {
                
                    self.songs.append(contentsOf: SongRespone.data)
                    print(self.songs.count)
                    for i in 0...self.songs.count-1{
                        if self.artist==self.songs[i].band{
                            self.filteredSongs.append(contentsOf: self.songs[i].songs)
                            
                        }
                        
                    }
             self.tableview.reloadData()
                    
                }
               
            }
                
            catch{print(error)}
        }.resume()
        
    }
}
extension SecondViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredSongs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! TableViewCell
        cell.songTitle.text=filteredSongs[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let  VC = storyboard.instantiateViewController(identifier: "thirdVC") as! ThirdViewController
                   
        VC.artist=self.artist
        VC.song=filteredSongs[indexPath.row].title
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}
