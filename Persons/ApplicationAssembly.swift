//
//  ApplicationAssembly.swift
//  Persons
//
//  Created by Sebastian Wramba on 25.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class ApplicationAssembly: TyphoonAssembly {
    
    dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
            definition.injectProperty("appDependencies", with: self.appDependencies())
        }
    }
    
    dynamic func appDependencies() -> AnyObject {
        return TyphoonDefinition.withClass(AppDependencies.self) {
            (definition) in
            definition.injectProperty("personDataStore", with: self.personDataStore())
            definition.afterInjections = "initialSetup"
        }
    }
    
    dynamic func personDataStore() -> AnyObject {
        return TyphoonDefinition.withClass(PersonCoreDataStore.self)
    }
    
}