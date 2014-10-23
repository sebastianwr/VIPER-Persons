//
//  PersonDataStore.swift
//  Persons
//
//  Created by Sebastian Wramba on 23.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation

protocol PersonDataStore {
    
    func findPersonWithId(remoteId: String, completionBlock: ((Person) -> Void)!)
    func findAll(completionBlock: (([Person]) -> Void)!)
}
