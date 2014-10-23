//
//  PersonDetailPresenter.swift
//  MdB
//
//  Created by Sebastian Wramba on 09.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation
import UIKit

class PersonDetailPresenter : NSObject {
    
    var interactor : PersonDetailInteractor?
    weak var userInterface : PersonDetailViewController?
    
    func configureViewForPersonWithId(viewController: PersonDetailViewController, id: String) {
        self.userInterface = viewController
        self.interactor?.findPersonForId(id)
    }
    
    func foundPerson(person: Person) {
        
        let url = NSURL(string: person.photoUrl)!
        let data = NSData(contentsOfURL: url, options: nil, error: nil)!
        let image = UIImage(data: data)!
        
        let localizedBirthday = NSDateFormatter.localizedStringFromDate(person.birthday, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        
        let personDetailViewModel = PersonDetailViewModel(name: person.firstName + " " + person.lastName, biography: person.shortBio, image: image, birthday: localizedBirthday)
        
        self.userInterface?.displayPerson(personDetailViewModel)
    }
    
    
    
}