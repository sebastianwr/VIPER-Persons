//
//  PersonListInteractor.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class PersonListInteractor : PersonListInteractorInput {

    let dataManager : PersonDataStore
    
    weak var delegate : PersonListInteractorOutput?
    
    init(dataManager: PersonDataStore) {
        self.dataManager = dataManager
    }
    
    func findAllPersons() {
        dataManager.findAll( { persons in
            self.delegate?.foundAllPersons(persons)
            return
        })
    }
    
}