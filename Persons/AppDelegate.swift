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

    var appDependencies: AppDependencies?
    
    var personListWireframe: PersonListWireframe?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        appDependencies?.initialSetup()
        
        self.installRootViewControllerIntoWindow(window!)
        
        return true
    }
    
    func applicationWillTerminate(application: UIApplication) {
        MagicalRecord.cleanUp()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        personListWireframe!.presentListInterfaceFromWindow(window)
    }
}