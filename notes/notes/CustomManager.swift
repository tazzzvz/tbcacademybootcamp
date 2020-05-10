//
//  CustomManager.swift
//  notes
//
//  Created by Tazo Japaridze on 5/10/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import Foundation
class CustomFileManager{
    let fm = FileManager.default
    
    private static let customManager = CustomFileManager()
    
    private init() {}
    
    var superPath: URL {
        return try! fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    static func defaultManager() -> CustomFileManager {
        return customManager
    }


    func createFile(name: String, text: String) -> Bool {
        let path = superPath.appendingPathComponent(name)
        do {
            try text.write(to: path, atomically: true, encoding: .utf8)
            return true
        } catch {}

        return false
    }


    func readText(name: String) -> String {
        let path = superPath.appendingPathComponent(name)
        do {
            let res = try String(contentsOf: path, encoding: .utf8)
            return res
        } catch {}
        return ""
    }
    
}
