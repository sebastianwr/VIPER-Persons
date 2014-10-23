//
//  Person.swift
//  Persons
//
//  Created by Sebastian Wramba on 22.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

class Person {
    
    let birthday: NSDate
    let photoUrl: String
    let firstName: String
    let lastName: String
    let occupation: String
    let remoteId: String
    let shortBio: String
    
    init(remoteId: String, firstName: String, lastName: String, birthday: NSDate, occupation: String, photoUrl: String, shortBio: String) {
        self.remoteId = remoteId
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.occupation = occupation
        self.photoUrl = photoUrl
        self.shortBio = shortBio
    }
    
    
}
