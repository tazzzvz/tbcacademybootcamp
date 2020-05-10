//
//  fullnoteViewController.swift
//  notes
//
//  Created by Tazo Japaridze on 5/8/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

protocol thirdprotocol {
    func sendseconddata(text2:String,index:Int)
}

class fullnoteViewController: UIViewController{
    @IBOutlet weak var fullnote: UITextView!
    var delegate3 :thirdprotocol?
    var a = ""
    var indx :Int?
    func getcounts(){
        let view = ViewController()
        let count = view.noteslist.count
        print(count)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem=UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))
        fullnote.text=a
      
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        getcounts()
    }
    @objc func save (){
        delegate3?.sendseconddata(text2: fullnote.text,index: indx ?? 0)
               self.navigationController?.popViewController(animated: true)
    }
   
   // ras ar wersce?ll cell ze dacherisas ubralod wakitxva unda shegedzlos da edit calke unda qondes, kai magas gavaketeb da exla rogorc aris wesit xo unda amatebdes im noteslistshi? vnaxav

}
