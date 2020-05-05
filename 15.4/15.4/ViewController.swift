//
//  ViewController.swift
//  davaleba15final
//
//  Created by Tazo Japaridze on 5/5/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

struct customdata {
    var  name : String
    var image : UIImage
    var category : Int
}

class ViewController: UIViewController {
    
    
    //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let data = [     customdata(name: "dsadas", image: #imageLiteral(resourceName: "6"), category: 1),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "5"), category: 1),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "3"), category: 1),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "1"), category: 2),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "8"), category: 2),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "4"), category: 2),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "9"), category: 3),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "7"), category: 3),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "2"), category: 3),
                     customdata(name: "dsadas", image: #imageLiteral(resourceName: "10"), category: 3)
    ]
    
    var dataforsecondpage=[customdata]()
    
    let button1 :UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("1", for: .normal)
        b.addTarget(self, action: #selector(Onbutton1), for: .touchUpInside)
        b.backgroundColor = .blue
        b.layer.cornerRadius=10
        
        return b
        
    }()
    
    lazy var collectionview : UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints=false
           cv.register(customcell.self, forCellWithReuseIdentifier: "cell")
        return cv}()
    var imageview :UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        //view.addSubview(navBar)
        //let navItem = UINavigationItem(title: "SomeTitle")
        //let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(selectorName:))
        //navItem.rightBarButtonItem = doneItem

        //navBar.setItems([navItem], animated: false)
       
       imageview=UIImageView(frame:    CGRect(x: 100  , y: 100, width: 200, height: 200))
       view.addSubview(button1)
        view.addSubview(imageview)
        view.addSubview(collectionview)
         collectionview.backgroundColor = .white
        //collectionview.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive=true
        collectionview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive=true
         collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive=true
         collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive=true
         collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive=true
         // Do any additional setup after loading the view.
         
         collectionview.delegate=self
         collectionview.dataSource=self
        // Do any additional setup after loading the view.
        NSLayoutConstraint.activate([
                           button1.topAnchor.constraint(equalTo: view.topAnchor,constant: 195),
                          button1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 310),
                          button1.heightAnchor.constraint(equalToConstant: 30),
                          button1.widthAnchor.constraint(equalToConstant: 30),

               ])
    }

    @objc func Onbutton1(){
                    
        
           // present(newvc, animated: false, completion: nil)
            //dataforsecondpage.append(   )
        
           }
}
extension ViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customcell
        cell.backgroundColor = .white
        cell.data=self.data[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let a=indexPath.row
        imageview.layer.cornerRadius=13
        imageview.image=data[a].image
        print("tz")
        return
        
    }
    
    
}
class customcell : UICollectionViewCell{
    
    var data:customdata?{
        didSet{
            guard let data = data else {return}
            bg.image=data.image}
    }
    
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints    =   false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds=true
        iv.layer.cornerRadius=10
        return iv
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive=true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive=true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive=true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive=true
        
        
    }
    
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

