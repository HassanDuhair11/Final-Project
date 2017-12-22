//
//  AppDelegate.swift
//  Qrobat2
//
//  Created by hassan duhair on 8/21/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift
import IQKeyboardManagerSwift
import SideMenuController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = .black
        
        IQKeyboardManager.sharedManager().enable = true
        print("the realm path is \(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "there is no realm file path" )")
        
//        addCategory()
        setUpMenu()
        
        return true
    }
    
    func setUpMenu(){
        
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "menu (4)")
        SideMenuController.preferences.drawing.sidePanelPosition = .underCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 300
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .slideAnimation
    }

    func addCategory(){
        
        let dbCountry = DBCountry()
        let dbCategory = DBCategory()

        let list1 = dbCountry.getCountryList(country1: "palestine", country2: "Egypt", country3: "syria")
        let category1 = Category(id: "1", name: "Sacrifice", image: "https://images.pexels.com/photos/248167/pexels-photo-248167.jpeg?h=350&dpr=2&auto=compress&cs=tinysrgb", shortTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", story: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries", countryList: list1)
        dbCategory.addCategory(category: category1)
     
        let list2 = dbCountry.getCountryList(country1: "France", country2: "Swiden", country3: "USA")
        let category2 = Category(id: "2", name: "Quran mamorization", image: "https://images.pexels.com/photos/683833/pexels-photo-683833.jpeg?h=350&dpr=2&auto=compress&cs=tinysrgb", shortTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", story: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries", countryList: list2)
        dbCategory.addCategory(category: category2)
        
        let list3 = dbCountry.getCountryList(country1: "Turky", country2: "Somal", country3: "syria")
        let category3 = Category(id: "3", name: "refugees support", image: "https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1454279536000/photosp/baffbdc7-11e8-410d-a3be-ced57f381ef3/stock-photo-family-lebanon-syrian-refugee-baffbdc7-11e8-410d-a3be-ced57f381ef3.jpg", shortTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", story: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries", countryList: list3)
        dbCategory.addCategory(category: category3)
        
        let list4 = dbCountry.getCountryList(country1: "USA", country2: "Australia", country3: "France")
        let category4 = Category(id: "4", name: "Mosques", image: "https://static.pexels.com/photos/161276/moscow-cathedral-mosque-prospekt-mira-ramadan-sky-161276.jpeg", shortTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", story: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries", countryList: list4)
        dbCategory.addCategory(category: category4)
        
        let list5 = dbCountry.getCountryList(country1: "palestine", country2: "Egypt", country3: "syria")
        let category5 = Category(id: "5", name: "Orohane help", image: "https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1448289602000/photosp/f8f9610c-d43f-484b-82ba-ea24d751d1f6/stock-photo-fruit-watermelon-children-fruits-happy-burmese-volunteer-orphanage-orphan-f8f9610c-d43f-484b-82ba-ea24d751d1f6.jpg", shortTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", story: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries", countryList: list5)
        dbCategory.addCategory(category: category5)
        
 
     }

}



























