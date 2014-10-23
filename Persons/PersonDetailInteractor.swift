//
//  PersonDetailInteractor.swift
//  MdB
//
//  Created by Sebastian Wramba on 09.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class PersonDetailInteractor {
    
    weak var delegate : PersonDetailPresenter?
    
    let dataManager : PersonDataStore
    
    init(dataManager: PersonDataStore) {
        self.dataManager = dataManager
    }
    
    func findPersonForId(id: String) {
        self.dataManager.findPersonWithId(id, completionBlock: { person in
            self.delegate?.foundPerson(person)
            return
        })
    }
}