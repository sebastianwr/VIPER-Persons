//
//  PersonDetailViewController.swift
//  MdB
//
//  Created by Sebastian Wramba on 09.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation
import UIKit

class PersonDetailViewController : UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var biographyTextView: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var person : PersonDetailViewModel?
    
    var presenter : PersonDetailPresenter?
    
    func displayPerson(personDetailViewModel: PersonDetailViewModel) {
        self.picture.image = personDetailViewModel.image
        self.nameLabel.text = personDetailViewModel.name
        self.biographyTextView.text =  personDetailViewModel.biography
        self.birthdayLabel.text = personDetailViewModel.birthday
    }
}
