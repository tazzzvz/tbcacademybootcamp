//
//  ViewController.swift
//  Folders
//
//  Created by Tazo Japaridze on 5/11/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var collectionview : UICollectionView!
    @IBOutlet var addfolder :UIBarButtonItem!
    var folderslist=[Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        collectionview.collectionViewLayout=layout
        layout.itemSize = CGSize(width: 123, height: 123)
        
        
        
        collectionview.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionview.delegate=self
        collectionview.dataSource=self
        // Do any additional setup after loading the view.
    }

    @IBAction func addfolder(_ sender: Any) {
        folderslist.append(Int.random(in: 0...100))
        collectionview.reloadData()
        
    }
    
}

extension ViewController :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Zz")
        print(indexPath)
        self.performSegue(withIdentifier: segueIds.segue_for_second_page, sender: nil)
    }
    }

extension ViewController :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        folderslist.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .systemIndigo
       return cell
    }
    
    
}
extension ViewController :UICollectionViewDelegateFlowLayout{
    
}

