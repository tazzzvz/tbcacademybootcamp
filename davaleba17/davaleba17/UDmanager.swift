//
//  UDmanager.swift
//  davaleba17
//
//  Created by Tazo Japaridze on 5/8/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import Foundation


class UDManager{
    
    internal static let bar = "bar"
     
       static func firstbar(){
           UserDefaults.standard.set("1", forKey: bar)
       }
       
       static func secondbar(){
           UserDefaults.standard.set("2", forKey: bar)
       }
       
       static func thirdbar(){
              UserDefaults.standard.set("3", forKey: bar)
          }
       
       static func remembere() -> String{
           return UserDefaults.standard.string(forKey: bar) ?? ""
       }
        }
    
//    static func name1(value:String){
//        getUD().set(name1: String)
//    }
//    
    
    
    
    
    
    
    
    

