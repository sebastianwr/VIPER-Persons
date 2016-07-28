//
//  PersonListDisplayData.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation

struct PersonListDisplayData {
    
    let sections : [PersonListDisplaySection]
    
    init(sections: [PersonListDisplaySection]) {
        self.sections = sections
    }
    
}
