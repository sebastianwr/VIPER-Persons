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

            definition.injectProperty("personListWireframe", with: self.personListWireframe())
            definition.injectProperty("personListInteractor", with: self.personListInteractor())
            definition.injectProperty("personListPresenter", with: self.personListPresenter())
            
            definition.injectProperty("personDetailInteractor", with: self.personDetailInteractor())

            
            definition.afterInjections = "initialSetup"
        }
    }
    
    // MARK: - Person List Module
    
    dynamic func personListWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListWireframe.self) {
            (definition) in
            
            definition.injectProperty("listPresenter", with: self.personListPresenter())
        }
    }
    
    dynamic func personListInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListInteractor.self) {
            (definition) in
            
            definition.useInitializer("initWithDataStore:") {
                (initializer) in
                
                initializer.injectParameterWith(self.personDataStore())
            }
            
            definition.injectProperty("delegate", with: self.personListPresenter())
        }
    }
    
    dynamic func personListPresenter() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListPresenter.self) {
            (definition) in
            definition.injectProperty("interactor", with: self.personListInteractor())
            definition.injectProperty("listWireframe", with: self.personListWireframe())
        }
    }
    
    // MARK: - Person Detail Module
    
    dynamic func personDetailInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailInteractor.self) {
            (definition) in
            definition.useInitializer("initWithDataStore:") {
                (initializer) in
                initializer.injectParameterWith(self.personDataStore())
            }
        }
    }
    
    // MARK: - Core Data
    
    dynamic func personDataStore() -> AnyObject {
        return TyphoonDefinition.withClass(PersonCoreDataStore.self)
    }
    
}