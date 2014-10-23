//
//  NSDateConvenience.swift
//  Persons
//
//  Created by Sebastian Wramba on 23.10.14.
//  Copyright (c) 2014 babiel GmbH. All rights reserved.
//

import Foundation

extension NSDate
{
    convenience init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)
        
        if(d != nil) {
            self.init(timeInterval:0, sinceDate:d!)
            return
        }
        
        self.init()
    }
}