//
//  ViewController.swift
//  api
//
//  Created by Tazo Japaridze on 5/19/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
struct GroupsResponse :Codable {
    let groups : [Groups]
    
    enum CodingKeys:String,CodingKey {
    case groups = "bands"
    }
}

struct Groups : Codable {
    let name    :String
    let image   :String
    let image1  :String
    let image2  :String
    let image3  :String
    let info    :String
    let genre   :String
    
    enum CodingKeys:String,CodingKey {
        case name
        case image  = "img_url"
        case image1 = "thumb1"
        case image2 = "thumb2"
        case image3 = "thumb3"
        case info
        case genre
    }
}

class ViewController: UIViewController {
    
    var groups = [Groups]()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        
        
    }
    
   
    
    
    
    
    
    
    func get(){
        
        let url = URL(string: "http://www.mocky.io/v2/5ec3e47a300000e4b039c515")!
        URLSession.shared.dataTask(with:url) { (data, res, err) in
            guard let data=data else {return}
            
            do{
                let decoder = JSONDecoder()
                let userRespone = try  decoder.decode(GroupsResponse.self,from: data)
                self.groups.append(contentsOf: userRespone.groups)
//                print(self.groups)

                DispatchQueue.main.async {
                    self.myCollectionView.reloadData()
                }
            }
                
            catch{print(error)}
        }.resume()
        
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
        groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.label.text=groups[indexPath.row].name
        groups[indexPath.row].image .downloadImage { (image) in
            DispatchQueue.main.async {
                 cell.imageView.image=image
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "secondView") as! SecondViewController
        
        VC.artist=groups[indexPath.row].name
        VC.info=groups[indexPath.row].info
        self.navigationController?.pushViewController(VC, animated: true)
        print("tapped")
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let itemWidth =  collectionView.frame.width / 2.2
               return CGSize(width: itemWidth - 0 - 0, height: 170)
           }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
               return .init(top:40, left: 0, bottom: 0, right: 0)
           }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
               return 10
           }
    
    
}
extension String{
    func downloadImage(completion: @escaping (UIImage?)->()){
        guard let url = URL(string: self) else{return}
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data=data else{return}
            completion(UIImage(data: data))
            
        }.resume()
    }
}
