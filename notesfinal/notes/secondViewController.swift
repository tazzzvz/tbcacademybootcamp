//
//  secondViewController.swift
//  notes
//
//  Created by Tazo Japaridze on 5/8/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

protocol secondprotocol {
    func getsomedata(text:String)
   
}

class secondViewController: UIViewController {

    @IBOutlet weak var secondtext: UITextView!
    
    
    var delegatee : secondprotocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem=UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saved))

        // Do any additional setup after loading the view.
    }
   @objc func saved(){
                if   secondtext.text == ""{}
                else{
                    delegatee?.getsomedata(text: secondtext.text)
                    self.navigationController?.popViewController(animated: true)
                    }
    }}
    




