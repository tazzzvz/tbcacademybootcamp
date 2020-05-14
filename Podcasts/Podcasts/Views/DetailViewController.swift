//
//  DetailViewController.swift
//  Podcasts
//
//  Created by Tazo Japaridze on 5/14/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController ,detailprotocol{
    func detailfunc(title: String, content: String, duration: String) {
       print(title)
        print("shemovida")
    }
    var title12=""
    var content=""
    var duration=""

    @IBOutlet weak var title1: UILabel!
    
    @IBOutlet weak var content1: UILabel!
    @IBOutlet weak var duration1: UILabel!
    
    
    

    override func viewDidLoad() {
        title1.text=title12
        content1.text=content
        duration1.text=duration
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

}
