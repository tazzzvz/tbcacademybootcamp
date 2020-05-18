//
//  ViewController.swift
//  davaleba
//
//  Created by Tazo Japaridze on 5/18/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

struct User: Codable{
    let id            : Int
    let name          : String
    let year          : Int
    let color         : String
    let pantone_value : String
}
struct Userresponse: Codable {

public var colors: [User]

enum CodingKeys: String, CodingKey {
       case colors = "data"
}
}

class ViewController: UIViewController {

    
    @IBOutlet weak var myCollectionview: UICollectionView!
    
    var colors=[User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionview.delegate=self
        myCollectionview.dataSource=self
        get()
        
//        myCollectionview.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
//        print(colors.count)
        
//        let url = URL(string: "https://reqres.in/api/unknown" )!
//       let task = URLSession.shared.dataTask(with: url) { (data ,res ,err) in
//
//        guard let data = data else{return}
//
//        let json = try? JSONSerialization.jsonObject(with: data, options: [])
//
//        guard let jsonDictionary = json as? [String:Any] else{return}
//
//        let userData=jsonDictionary["data"] as? Array<Dictionary<String, Any>>
//
//        print(userData)
////        let gold=UIColor(hex: "#E2583E")
//
//        }
//        task.resume()
        
    }
    
    func get(){
        let url = URL(string: "https://reqres.in/api/unknown")!
            URLSession.shared.dataTask(with: url){ (data, res, err) in
                guard let data = data else {return}
                do{
                    let decoder = JSONDecoder()
                    
                    let userresponse = try decoder.decode(Userresponse.self, from: data)
                    self.colors.append(contentsOf: userresponse.colors)
                    
                    DispatchQueue.main.async {
                        self.myCollectionview.reloadData()
                    }
    
                    } catch {print("error")}
                
                }.resume()
        
    }


}
extension ViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            print("tapped")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  vc = storyboard.instantiateViewController(identifier: "secondVc") as! SecondViewController
        
        vc.color = colors[indexPath.row].color
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        let color=colors[indexPath.row]
        cell.text1.text=color.color
        cell.text2.text=color.name
        cell.backgroundColor = hexStringToUIColor(hex: color.color)
        
        return cell
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





//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b, a: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }


