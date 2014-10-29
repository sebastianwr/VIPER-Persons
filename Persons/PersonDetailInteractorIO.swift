//
//  PersonDetailInteractorIO.swift
//  Persons
//
//  Created by Sebastian Wramba on 23.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

@objc protocol PersonDetailInteractorInput : class {
    func findPersonForId(id: String)
}

@objc protocol PersonDetailInteractorOutput : class {
    func foundPerson(person: Person)
}
