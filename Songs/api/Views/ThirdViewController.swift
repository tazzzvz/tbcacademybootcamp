//
//  ThirdViewController.swift
//  api
//
//  Created by Tazo Japaridze on 5/20/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

struct Lyric:Codable {
    let lyrics:String
}

class ThirdViewController: UIViewController {
    @IBOutlet weak var lyricLabel: UILabel!
    var artist:String!
    var song:String!
    var cold="Coldplay"
    var song1="adventure%20of%20a%20Lifetime"
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title=song
            get()
       
    }
    func finalUrl(artist:String,song:String)->String{
        let a="https://api.lyrics.ovh/v1/"
        let b="/"
        let newArtist=artist.replacingOccurrences(of: "/", with: "")
        let c=a+newArtist+b+song
        
        let newString = c.replacingOccurrences(of: " ", with: "%20")
        
        return newString
        
    }

   func get(){
            
    let url = URL(string: finalUrl(artist: artist, song: song))!
            URLSession.shared.dataTask(with:url) { (data, res, err) in
                guard let data=data else {return}
                
                do{
                    let decoder = JSONDecoder()
                    let userRespone = try  decoder.decode(Lyric.self,from: data)
                    DispatchQueue.main.async {
                        self.lyricLabel.text=userRespone.lyrics
                    }
                }
                    
                catch{print(error)}
            }.resume()
            
        }

}
