//
//  userdefaults.swift
//  davaleba16
//
//  Created by Tazo Japaridze on 5/6/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import Foundation
struct keys {
    
}

class udmanager{
    
        internal static let key_firstname = "key_firstname"
        internal static let key_password = "key_password"
        internal static let loggedin = "loggedin"
        internal static let key_login = "key_login"
        internal static let text_key = "text_key"
        internal static let background_key = "background_key"
    
    
    
    
    
    static func getUD() -> UserDefaults{
        return UserDefaults.standard
        
    }
    static func savetext(value:String){
        getUD().set(value,forKey:text_key )
    }
    static func gettext() -> String{
        return getUD().string(forKey:text_key) ?? ""
    }
    
    static func savelogin(value:String){
        getUD().set(value, forKey: key_login)
    }
    static func getlogin() ->String{
        
        return getUD().string(forKey:key_login) ?? ""
        
    }
    static func savename(value:String){
        getUD().set(value, forKey: key_firstname)
    }
    
    
    static func getname() -> String{
        
        return getUD().string(forKey: key_firstname) ?? ""
    }
    static func darkmode(){
        getUD().set(true, forKey: background_key)
    }
    static func darkomodeoff(){
        getUD().set(false, forKey: background_key)
    }
    static func darkmodeon() -> Bool {
        getUD().bool(forKey: background_key)
    }
    
    static func logedin(){
        getUD().set(true,forKey:loggedin)
    }
    
    static func offloggedin(){
        getUD().set(false,forKey:loggedin)
    }
    static func isloggedin() -> Bool {
        getUD().bool(forKey:loggedin)
    }
    
    
    
}
