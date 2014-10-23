//
//  PersonDetailViewModel.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation
import UIKit

class PersonListViewModel : NSObject {
    
    var id: String
    var name : String
    var image : UIImage
    var detailInformation : String
    
    init(id: String, name: String, detailInformation: String, image: UIImage) {
        self.id = id
        self.name = name
        self.detailInformation = detailInformation
        self.image = image
    }
}