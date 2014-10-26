//
//  AppDependencies.swift
//  MdB
//
//  Created by Sebastian Wramba on 01.10.14.
//  Copyright (c) 2014 Sebastian Wramba. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies: NSObject {
    
    var listWireframe = PersonListWireframe()
    var detailWireframe = PersonDetailWireframe()
    
    var personDataStore: PersonDataStore?
    
    var personListInteractor: PersonListInteractor?

    var personDetailInteractor: PersonDetailInteractor?
    
    func initialSetup() {
        initCoreData()
        initCoreDataSeed()
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        
        let personListPresenter = PersonListPresenter()
        
        let rootWireframe = RootWireframe()
        
        personListInteractor!.delegate = personListPresenter
        personListPresenter.interactor = personListInteractor!
        personListPresenter.listWireframe = listWireframe
        
        listWireframe.rootWireframe = rootWireframe
        listWireframe.listPresenter = personListPresenter
        listWireframe.detailWireframe = detailWireframe
        
        let personDetailPresenter = PersonDetailPresenter()
        
        personDetailInteractor!.delegate = personDetailPresenter
        personDetailPresenter.interactor = personDetailInteractor!
        
        detailWireframe.presenter = personDetailPresenter
        
    }
    
    // MARK: - Core Data Stack
    
    func initCoreData() {
        MagicalRecord.setupCoreDataStack()
    }
    
    func initCoreDataSeed() {
        
        
        let personCount = ManagedPerson.MR_countOfEntities()
        
        if(personCount > 0) {
            return
        }
        
        MagicalRecord.saveWithBlockAndWait { context in
            
            
            
            var managedPerson1: ManagedPerson = ManagedPerson.MR_createEntity() as ManagedPerson
            managedPerson1.firstName = "Peter"
            managedPerson1.lastName = "Jackson"
            managedPerson1.occupation = "Director"
            managedPerson1.photoUrl = "http://ia.media-imdb.com/images/M/MV5BMTY1MzQ3NjA2OV5BMl5BanBnXkFtZTcwNTExOTA5OA@@._V1_SY317_CR8,0,214,317_AL_.jpg"
            managedPerson1.remoteId = NSUUID().UUIDString
            managedPerson1.shortBio = "Peter Jackson was born as an only child in a small coast-side town in New Zealand in 1961. When a friend of his parents bought him a super 8 movie camera (because she saw how much he enjoyed taking photos), the then eight-year-old Peter instantly grabbed the thing to start recording his own movies, which he made with his friends."
            managedPerson1.birthday = NSDate(dateString: "1961-10-31")
            
            var managedPerson2: ManagedPerson = ManagedPerson.MR_createEntity() as ManagedPerson
            managedPerson2.firstName = "Jason"
            managedPerson2.lastName = "Statham"
            managedPerson2.occupation = "Actor"
            managedPerson2.photoUrl = "http://ia.media-imdb.com/images/M/MV5BMTkxMzk2MDkwOV5BMl5BanBnXkFtZTcwMDAxODQwMg@@._V1_SX214_CR0,0,214,317_AL_.jpg"
            managedPerson2.remoteId = NSUUID().UUIDString
            managedPerson2.shortBio = "Jason Statham was born in Shirebrook, Derbyshire, to Eileen (Yates), a dancer, and Barry Statham, a street merchant and lounge singer. Statham has done quite a lot in a short time. He has been a Diver on the British National Diving Team and finished 12th in the World Championships in 1992."
            managedPerson2.birthday = NSDate(dateString: "1967-07-26")
            
            var managedPerson3: ManagedPerson = ManagedPerson.MR_createEntity() as ManagedPerson
            managedPerson3.firstName = "Hugh"
            managedPerson3.lastName = "Jackman"
            managedPerson3.occupation = "Actor"
            managedPerson3.photoUrl = "http://ia.media-imdb.com/images/M/MV5BNDExMzIzNjk3Nl5BMl5BanBnXkFtZTcwOTE4NDU5OA@@._V1_SX214_CR0,0,214,317_AL_.jpg"
            managedPerson3.remoteId = NSUUID().UUIDString
            managedPerson3.shortBio = "Hugh Jackman was born in Sydney, New South Wales, to Grace McNeil (Greenwood) and Christopher John Jackman, an accountant. He is the youngest of five children. His parents, both English, moved to Australia shortly before his birth, and one of his paternal great-grandfathers was Greek."
            managedPerson3.birthday = NSDate(dateString: "1968-10-12")
            
            var managedPerson4: ManagedPerson = ManagedPerson.MR_createEntity() as ManagedPerson
            managedPerson4.firstName = "Jennifer"
            managedPerson4.lastName = "Lawrence"
            managedPerson4.occupation = "Actress"
            managedPerson4.photoUrl = "http://ia.media-imdb.com/images/M/MV5BMTM4OTY2MDY1M15BMl5BanBnXkFtZTcwNDYyNDM3NA@@._V1_SY317_CR2,0,214,317_AL_.jpg"
            managedPerson4.remoteId = NSUUID().UUIDString
            managedPerson4.shortBio = "Academy Award-winning actress Jennifer Lawrence, best-known for playing Katniss Everdeen in Die Tribute von Panem - The Hunger Games (2012), was born in Louisville, Kentucky on August 15, 1990, to Karen (Koch), who manages a children's camp, and Gary Lawrence, who works in construction."
            managedPerson4.birthday = NSDate(dateString: "1990-08-15")
            
            
        }
        
        
    }
    
}