//
//  PersonListAssembly.swift
//  Persons
//
//  Created by Sebastian Wramba on 29.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class PersonListAssembly: TyphoonAssembly {
    
    var applicationAssembly: ApplicationAssembly!
    var personDetailAssembly: PersonDetailAssembly!
    
    dynamic func personListWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListWireframe.self) {
            (definition) in
            
            definition.injectProperty("listPresenter", with: self.personListPresenter())
            definition.injectProperty("rootWireframe", with: self.applicationAssembly.rootWireframe())
            definition.injectProperty("detailWireframe", with: self.personDetailAssembly.personDetailWireframe())
        }
    }
    
    dynamic func personListInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PersonListInteractor.self) {
            (definition) in
            
            definition.useInitializer("initWithDataStore:") {
                (initializer) in
                
                initializer.injectParameterWith(self.applicationAssembly.personDataStore())
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
    
}
