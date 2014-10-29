//
//  ApplicationAssembly.swift
//  Persons
//
//  Created by Sebastian Wramba on 25.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class ApplicationAssembly: TyphoonAssembly {
    
    var personListAssembly: PersonListAssembly!
    
    dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
            definition.injectProperty("appDependencies", with: self.appDependencies())
            definition.injectProperty("personListWireframe", with: self.personListAssembly.personListWireframe())
        }
    }
    
    dynamic func appDependencies() -> AnyObject {
        return TyphoonDefinition.withClass(AppDependencies.self)
    }
    
    dynamic func rootWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(RootWireframe.self)
    }
    
    dynamic func mainStoryboard() -> AnyObject {
        return TyphoonDefinition.withClass(TyphoonStoryboard.self) {
            (definition) in
            
            definition.useInitializer("storyboardWithName:factory:bundle:") {
                (initializer) in
                
                initializer.injectParameterWith("Main")
                initializer.injectParameterWith(self)
                initializer.injectParameterWith(NSBundle.mainBundle())
            }

            definition.scope = TyphoonScope.Singleton
        }
    }
    
    // MARK: - Core Data
    
    dynamic func personDataStore() -> AnyObject {
        return TyphoonDefinition.withClass(PersonCoreDataStore.self)
    }
    
}