//
//  PersonListDisplaySection.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation

struct PersonListDisplaySection {
    let name : String = ""
    var items : [PersonListViewModel] = []
    
    init(name: String, items: [PersonListViewModel]?) {
        self.name = name
        
        if(items != nil) {
            self.items = items!
        }
    }
}