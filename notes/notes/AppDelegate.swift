//
//  AppDelegate.swift
//  notes
//
//  Created by Tazo Japaridze on 5/8/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,movearrayprotocol{
    func movearray(string: Array<Any>) {
        
    }
    
    
    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    func applicationWillTerminate(_ application: UIApplication) {
        
        
      
        
        
        
        
        
        
//
//        var delegate2 : newprotocol?
//
//        print()
//        let view = ViewController()
//        print(view.getarraycount())
//
//        let filename = "test"
//        let documentdirurl=try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        let fileUrl=documentdirurl.appendingPathComponent(filename).appendingPathExtension("txt")
//        print(fileUrl.path)
//        for i in 0...view.noteslist.count{
//            let WriteString = view.noteslist[i]
//            print(i)
//
//            do {
//                try WriteString.write(to: fileUrl, atomically: true, encoding: String.Encoding.utf8)
//            }
//            catch let error as NSError{
//                print("ver chavwere")
//                print(error)
//            }}

        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

