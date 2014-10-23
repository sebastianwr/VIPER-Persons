//
//  ApplicationAssembly.swift
//  Persons
//
//  Created by Sebastian Wramba on 23.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class ApplicationAssembly : TyphoonAssembly {
    
    dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self)
//            {
//            (definition) in
//            
//            definition.injectProperty("appDependencies", with: self.appDependencies())
//        }
    }
    
    dynamic func appDependencies() -> AnyObject {
        return TyphoonDefinition.withClass(AppDependencies.self) {
            (definition) in

            definition.injectProperty("personListInteractor", with: self.personListInteractor())
        }
    }
    
    dynamic func personListInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListInteractor.self) {
            (definition) in
            
            definition.useInitializer("initWithDataManager:") {
                (initializer) in
                
                initializer.injectParameterWith(self.personCoreDataStore())
            }
        }
    }
    
    dynamic func personCoreDataStore() -> AnyObject {
        return TyphoonDefinition.withClass(PersonCoreDataStore.self)
    }
    
}