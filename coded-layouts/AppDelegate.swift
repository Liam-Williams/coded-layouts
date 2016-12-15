//
//  AppDelegate.swift
//  coded-layouts
//
//  Created by Liam Williams on 2016-12-15.
//  Copyright © 2016 lighthouse. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow()
    
    window?.rootViewController = UINavigationController(rootViewController: ViewController())
    
    window?.makeKeyAndVisible()
    
    return true
  }

}

