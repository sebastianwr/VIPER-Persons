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
            definition.injectProperty("personListInteractor", with: self.personListInteractor())
            definition.injectProperty("personDetailInteractor", with: self.personDetailInteractor())
            
            definition.afterInjections = "initialSetup"
        }
    }
    
    dynamic func personListInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListInteractor.self) {
            (definition) in
            definition.useInitializer("initWithDataStore:") {
                (initializer) in
                initializer.injectParameterWith(self.personDataStore())
            }
        }
    }
    
    dynamic func personDetailInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailInteractor.self) {
            (definition) in
            definition.useInitializer("initWithDataStore:") {
                (initializer) in
                initializer.injectParameterWith(self.personDataStore())
            }
        }
    }
    
    dynamic func personDataStore() -> AnyObject {
        return TyphoonDefinition.withClass(PersonCoreDataStore.self)
    }
    
}