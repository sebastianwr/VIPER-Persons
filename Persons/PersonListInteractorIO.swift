//
//  PersonListInteractorIO.swift
//  Persons
//
//  Created by Sebastian Wramba on 23.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

protocol PersonListInteractorInput : class {
    func findAllPersons()
}

protocol PersonListInteractorOutput : class {
     func foundAllPersons(persons: [Person]) -> ()
}
