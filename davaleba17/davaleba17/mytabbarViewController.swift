//
//  mytabbarViewController.swift
//  davaleba17
//
//  Created by Tazo Japaridze on 5/8/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit


class mytabbarViewController: UITabBarController {
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 2
        
        if UDManager.remembere() == "1"{
            self.selectedIndex = 0
        } else if UDManager.remembere() == "2"{
            self.selectedIndex = 1
        } else if UDManager.remembere() == "3"{
            self.selectedIndex = 2
        }
        
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
extension   mytabbarViewController :UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print(fromVC)
        print("zt")
        return nil
    }
}

