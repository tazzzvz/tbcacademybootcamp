//
//  TabBarViewController.swift
//  TazZzBooK
//
//  Created by Tazo Japaridze on 5/17/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    var user:User?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.selectedIndex=2
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
