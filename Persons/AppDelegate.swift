//
//  AppDelegate.swift
//  Persons
//
//  Created by Sebastian Wramba on 22.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let appDependencies = AppDependencies()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        appDependencies.installRootViewControllerIntoWindow(window!)
        
        return true
    }
    
    func applicationWillTerminate(application: UIApplication) {
        MagicalRecord.cleanUp()
    }
}