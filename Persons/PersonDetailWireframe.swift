//
//  PersonDetailWireframe.swift
//  MdB
//
//  Created by Sebastian Wramba on 09.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation
import UIKit

let PersonDetailViewControllerIdentifier = "PersonDetailViewController"

class PersonDetailWireframe : NSObject {
    
    var presenter : PersonDetailPresenter?
    var navigationController : UINavigationController?
    
    func presentDetailView(personId: String, viewController: UINavigationController) {
        
        let newViewController = detailViewController()
        let view = newViewController.view
        newViewController.presenter = presenter
        
        presenter?.configureViewForPersonWithId(newViewController, id: personId)
        
        viewController.pushViewController(newViewController, animated: true)
        
    }
    
    
    func detailViewController() -> PersonDetailViewController {
        let storyboard = mainStoryboard()
        let detailViewController: PersonDetailViewController = storyboard.instantiateViewControllerWithIdentifier(PersonDetailViewControllerIdentifier) as PersonDetailViewController
        return detailViewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}