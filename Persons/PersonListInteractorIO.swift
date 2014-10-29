//
//  PersonListInteractorIO.swift
//  Persons
//
//  Created by Sebastian Wramba on 23.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

@objc protocol PersonListInteractorInput : class {
    func findAllPersons()
}

@objc protocol PersonListInteractorOutput : class {
     func foundAllPersons(persons: [Person]) -> ()
}
