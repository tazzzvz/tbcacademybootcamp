//
//  ViewController.swift
//  Countries
//
//  Created by Tazo Japaridze on 5/21/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit
struct CountriesResponse : Codable{
    let name:String
    let capital:String
    let currencies:[Currency]
    let borders:[String]
}

struct Currency: Codable {
    let code, name, symbol: String?
}

typealias Welcome = [CountriesResponse]



class ViewController: UIViewController {
    var countryArray=["georgia","usa","london"]
    var searchCountry=[CountriesResponse]()
    var searching=false
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var countriesArray = [CountriesResponse]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        tableView.rowHeight=300
        searchBar.delegate=self
        get()
       
    }
    
   
    func get(){
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
        URLSession.shared.dataTask(with:url) { (data, res, err) in
            guard let data=data else {return}
            
            do{
                let decoder = JSONDecoder()

                let countriesRespone=try decoder.decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    self.countriesArray=countriesRespone
                    self.tableView.reloadData()
                }
            }
            catch{print(error)}
        }.resume()
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
        return   searchCountry.count
            
        }
        else{
        return countriesArray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if searching{
            cell.country.text=searchCountry[indexPath.row].name
            cell.capital.text=searchCountry[indexPath.row].capital
            cell.currency.text=searchCountry[indexPath.row].currencies[0].symbol
            cell.borders.text=searchCountry[indexPath.row].borders.joined(separator: ", ")
            return cell
        }
        else{
        cell.country.text=countriesArray[indexPath.row].name
        cell.capital.text=countriesArray[indexPath.row].capital
        cell.currency.text=countriesArray[indexPath.row].currencies[0].symbol
        cell.borders.text=countriesArray[indexPath.row].borders.joined(separator: ", ")
   
            return cell}
    }
    
    
}
extension ViewController   :UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = countriesArray.filter( {$0.name.prefix(searchText.count)==searchText || $0.capital.prefix(searchText.count)==searchText } );
        searching=true
        tableView.reloadData()
    }
}
