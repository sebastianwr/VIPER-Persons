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
    var listViewController : PersonListViewController?
    
    var detailWireframe : PersonDetailWireframe?
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        let viewController = listViewControllerFromStoryboard()
        viewController.presenter = listPresenter
        listViewController = viewController
        listPresenter!.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    func listViewControllerFromStoryboard() -> PersonListViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ListViewControllerIdentifier) as PersonListViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
    func presentPersonDetailWireframe(personId: String, navigationController: UINavigationController!) {
        self.detailWireframe?.presentDetailView(personId, viewController: navigationController)
    }
    
}