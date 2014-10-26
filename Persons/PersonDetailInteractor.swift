//
//  PersonDetailInteractor.swift
//  MdB
//
//  Created by Sebastian Wramba on 09.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class PersonDetailInteractor: NSObject, PersonDetailInteractorInput {
    
    weak var delegate : PersonDetailInteractorOutput?
    
    let dataStore : PersonDataStore
    
    init(dataStore: PersonDataStore) {
        self.dataStore = dataStore
    }
    
    func findPersonForId(id: String) {
        dataStore.findPersonWithId(id, completionBlock: { person in
            self.delegate?.foundPerson(person)
            return
        })
    }
}