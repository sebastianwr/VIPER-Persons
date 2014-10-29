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
            definition.injectProperty("personListWireframe", with: self.personListWireframe())
        }
    }
    
    dynamic func appDependencies() -> AnyObject {
        return TyphoonDefinition.withClass(AppDependencies.self)
    }
    
    dynamic func rootWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(RootWireframe.self)
    }
    
    // MARK: - Person List Module
    
    dynamic func personListWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListWireframe.self) {
            (definition) in
            
            definition.injectProperty("listPresenter", with: self.personListPresenter())
            definition.injectProperty("rootWireframe", with: self.rootWireframe())
            definition.injectProperty("detailWireframe", with: self.personDetailWireframe())
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
    
    dynamic func personDetailWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailWireframe.self) {
            (definition) in
            
            definition.injectProperty("presenter", with: self.personDetailPresenter())
        }
    }
    
    dynamic func personDetailInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailInteractor.self) {
            (definition) in
            
            definition.useInitializer("initWithDataStore:") {
                (initializer) in
            
                initializer.injectParameterWith(self.personDataStore())
            }
            
            definition.injectProperty("delegate", with: self.personDetailPresenter())
        }
    }
    
    dynamic func personDetailPresenter() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailPresenter.self) {
            (definition) in
            
            definition.injectProperty("interactor", with: self.personDetailInteractor())
        }
    }
    
    
    // MARK: - Core Data
    
    dynamic func personDataStore() -> AnyObject {
        return TyphoonDefinition.withClass(PersonCoreDataStore.self)
    }
    
}