//
//  ThirdViewController.swift
//  Folders
//
//  Created by Tazo Japaridze on 5/12/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
protocol CreateUpdatePageDelegate {
    func shouldReloadTableviewData()
    func noteDidUpdated()
}

class ThirdViewController: UIViewController {
    var createupdatedelegate : CreateUpdatePageDelegate?
    @IBOutlet weak var textfield: UITextView!
    override func viewDidLoad() {
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

    @IBAction func save(_ sender: Any) {
        createnote()
        textfield.text=""
        
        
        
    }
    
    func createnote(){
        
        let fm = FileManager.default
        let docurl = try! fm.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        
        let filename = "note_\(Int.random(in: 0...10000)).txt"
        let notefileurl = docurl.appendingPathComponent(filename)
        print(notefileurl)
        
        try! textfield?.text.write(to: notefileurl, atomically: true, encoding: .utf8)
        createupdatedelegate?.shouldReloadTableviewData()   
    }
}

