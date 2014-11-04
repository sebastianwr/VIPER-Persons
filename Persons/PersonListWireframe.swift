//
//  PersonListWireframe.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation
import UIKit

let ListViewControllerIdentifier = "PersonListViewController"

class PersonListWireframe : NSObject {

    var listPresenter : PersonListPresenter?
    var rootWireframe : RootWireframe?
    
    var listViewController: PersonListViewController?
    
    var detailWireframe : PersonDetailWireframe?
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        rootWireframe?.showRootViewController(listViewController!, inWindow: window)
    }
    
    func presentPersonDetailWireframe(personId: String) {
        self.detailWireframe?.presentDetailView(personId, viewController: listViewController!.navigationController!)
    }
    
}