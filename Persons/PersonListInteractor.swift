//
//  PersonListInteractor.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class PersonListInteractor : NSObject, PersonListInteractorInput {

    let dataStore : PersonDataStore
    
    weak var delegate : PersonListInteractorOutput?
    
    init(dataStore: PersonDataStore) {
        self.dataStore = dataStore
    }
    
    func findAllPersons() {
        dataStore.findAll( { persons in
            self.delegate?.foundAllPersons(persons)
            return
        })
    }
    
}