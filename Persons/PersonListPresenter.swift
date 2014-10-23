//
//  PersonListPresenter.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation
import UIKit

class PersonListPresenter : NSObject {
    
    var interactor : PersonListInteractor?
    weak var listWireframe : PersonListWireframe?
    weak var userInterface : PersonListViewController?
    
    func updateView() {
        self.interactor?.findAllPersons()
    }
    
    func foundAllPersons(persons: [Person]) -> () {
        
        var sections : [PersonListDisplaySection] = []
        
        var sectionsDict : Dictionary<String, [PersonListViewModel]> = Dictionary()
        
        // Step 1 - Sort persons into dictionary, key is first letter of last name
        for person in persons {
            
            // TODO Image loading is nothing the presenter should be concerned of ... but where to put it?
            let url = NSURL(string: person.photoUrl)!
            let data = NSData(contentsOfURL: url, options: nil, error: nil)!
            let image = UIImage(data: data)!

            let personListViewModel = PersonListViewModel(id: person.remoteId, name: person.firstName + " " + person.lastName, detailInformation: person.occupation, image: image)
            
            let firstLetter = person.lastName.substringToIndex(advance(person.lastName.startIndex, 1))
            if var existingSection : [PersonListViewModel] = sectionsDict[firstLetter] {
                existingSection.append(personListViewModel)
                sectionsDict[firstLetter] = existingSection
            }
            else {
                var newSection : [PersonListViewModel] = []
                newSection.append(personListViewModel)
                sectionsDict[firstLetter] = newSection
            }
        }
        
        // Step 2 - Create display data struct for the view controller to handle easily
        
        for key in Array(sectionsDict.keys).sorted(<) {
            let section = PersonListDisplaySection(name: key, items: sectionsDict[key])
            sections.append(section)
        }
        
        self.userInterface?.displayData = PersonListDisplayData(sections: sections)
        self.userInterface?.reloadEntries()
    }
    
    func handleCellSelection(person: PersonListViewModel) {
        self.listWireframe?.presentPersonDetailWireframe(person.id, navigationController: self.userInterface?.navigationController)
    }
    
    
}