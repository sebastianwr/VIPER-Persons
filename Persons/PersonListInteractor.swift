//
//  PersonListInteractor.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation

class PersonListInteractor : NSObject {

    let dataManager : PersonDataStore
    
    weak var delegate : PersonListPresenter?
    
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