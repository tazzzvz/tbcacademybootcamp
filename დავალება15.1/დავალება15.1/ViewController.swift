//
//  ViewController.swift
//  დავალება15.1
//
//  Created by Tazo Japaridze on 5/5/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        var collectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints=false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
 
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionview)
        collectionview.backgroundColor = .white
       // collectionview.topAnchor.constraint(equalTo: view.topAnchor, constant: 640).isActive=true
       // collectionview.heightAnchor.constraint(equalTo: collectionview.heightAnchor, multiplier: 0.5).isActive=true
        collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive=true
        collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive=true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive=true
        // Do any additional setup after loading the view.
        
        collectionview.delegate=self
        collectionview.dataSource=self
    }


}
extension ViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}
