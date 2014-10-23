//
//  ManagedPerson.swift
//  Persons
//
//  Created by Sebastian Wramba on 22.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation
import CoreData

@objc
class ManagedPerson: NSManagedObject {

    @NSManaged var birthday: NSDate
    @NSManaged var photoUrl: String
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var occupation: String
    @NSManaged var remoteId: String
    @NSManaged var shortBio: String
    
    override class func MR_entityName() -> String {
        return "Person"
    }

}
