//
//  SecondViewController.swift
//  davaleba
//
//  Created by Tazo Japaridze on 5/19/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

struct jokes:Codable {
//    let categories       : [String]
//    let created_at       : String
//    let icon_url         : String
//    let id               : String
//    let updated_at       : String
//    let url              : String
    let value            : String
   
}

class SecondViewController: UIViewController {
    var joke : String?
    var color : String?
    @IBOutlet weak var jokeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
        view.backgroundColor=hexStringToUIColor(hex: color!)
      
    }
    
func get(){
            let url = URL(string: "https://api.chucknorris.io/jokes/random?category=dev")!

            URLSession.shared.dataTask(with: url){ (data, res, err) in
                guard let data = data else {return}
                do{
                    let decoder = JSONDecoder()
                    
                    let userresponser = try decoder.decode(jokes.self, from: data)
                    self.joke=userresponser.value
                    
                    DispatchQueue.main.async {
                        self.jokeLabel.text=self.joke
                    }
    
                    } catch {print("error")}
                
                }.resume()
        
    }

}
