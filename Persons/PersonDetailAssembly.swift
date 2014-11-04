//
//  PersonDetailAssembly.swift
//  Persons
//
//  Created by Sebastian Wramba on 29.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class PersonDetailAssembly: TyphoonAssembly {
    
    var applicationAssembly: ApplicationAssembly!
    
    dynamic func personDetailWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailWireframe.self) {
            (definition) in
            
            definition.injectProperty("presenter", with: self.personDetailPresenter())
            definition.injectProperty("detailViewController", with: self.personDetailViewController())
        }
    }
    
    dynamic func personDetailInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailInteractor.self) {
            (definition) in
            
            definition.useInitializer("initWithDataStore:") {
                (initializer) in
                
                initializer.injectParameterWith(self.applicationAssembly.personDataStore())
            }
            
            definition.injectProperty("delegate", with: self.personDetailPresenter())
        }
    }
    
    dynamic func personDetailPresenter() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailPresenter.self) {
            (definition) in
            
            definition.injectProperty("interactor", with: self.personDetailInteractor())
            definition.injectProperty("userInterface", with: self.personDetailViewController())
        }
    }
    
    dynamic func personDetailViewController() -> AnyObject {
        return TyphoonDefinition.withClass(PersonDetailViewController.self) {
            (definition) in
            
            definition.factory = self.applicationAssembly.mainStoryboard()
            definition.useInitializer("instantiateViewControllerWithIdentifier:", parameters: { (factoryMethod) in
                factoryMethod.injectParameterWith(PersonDetailViewControllerIdentifier)
            })
            
            definition.injectProperty("presenter", with: self.personDetailPresenter())
        }
        
    }
    
}