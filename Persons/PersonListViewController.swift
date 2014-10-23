//
//  PersonListViewController.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation
import UIKit

let CellIdentifier = "PersonListCellIdentifier"

class PersonListViewController : UITableViewController {
    
    var displayData : PersonListDisplayData?
    var presenter : PersonListPresenter?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.updateView()
    }
    
    func reloadEntries() {
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSections = displayData?.sections.count
        
        if displayData?.sections.count == nil {
            numberOfSections = 0
        }
        
        return numberOfSections!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let upcomingSection = displayData?.sections[section]
        return upcomingSection!.items.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        let upcomingSection = displayData?.sections[section]
        return upcomingSection!.name
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let upcomingSection = displayData?.sections[indexPath.section]
        let personItem : PersonListViewModel = upcomingSection!.items[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.imageView.image = personItem.image
        cell.textLabel.text = personItem.name
        cell.detailTextLabel!.text = personItem.detailInformation
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void {
        let section = displayData?.sections[indexPath.section]
        let person = section!.items[indexPath.row]
        self.presenter?.handleCellSelection(person)
    }
}