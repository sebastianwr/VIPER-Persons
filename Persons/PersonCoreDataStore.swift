//
//  PersonCoreDataStore.swift
//  Persons
//
//  Created by Sebastian Wramba on 23.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation

class PersonCoreDataStore: PersonDataStore {

    func findPersonWithId(remoteId: String, completionBlock: ((Person) -> Void)!) {
        let results = ManagedPerson.MR_findByAttribute("remoteId", withValue: remoteId) as [ManagedPerson]
        let result = results.last
        
        if(result != nil) {
            let managedPerson = result!
            let person = Person(remoteId: managedPerson.remoteId, firstName: managedPerson.firstName, lastName: managedPerson.lastName, birthday: managedPerson.birthday, occupation: managedPerson.occupation, photoUrl: managedPerson.photoUrl, shortBio: managedPerson.shortBio)
            completionBlock(person)
        }
    }
    
    func findAll(completionBlock: (([Person]) -> Void)!) {
        let results = ManagedPerson.MR_findAll() as [ManagedPerson]
        
        let persons = self.personsFromDataStoreEntries(results)
        completionBlock(persons)
    }
    
    private func personsFromDataStoreEntries(entries: [ManagedPerson]) -> [Person] {
        var persons : [Person] = []
        
        for managedPerson in entries {
            
            let person = Person(remoteId: managedPerson.remoteId, firstName: managedPerson.firstName, lastName: managedPerson.lastName, birthday: managedPerson.birthday, occupation: managedPerson.occupation, photoUrl: managedPerson.photoUrl, shortBio: managedPerson.shortBio)
            
            persons.append(person)
        }
        
        return persons
    }
    
}
