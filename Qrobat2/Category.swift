//
//  Category.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    dynamic var id: String!
    dynamic var name: String!
    dynamic var image: String!
    dynamic var shortTitle: String!
    dynamic var story: String!
    var countryList = List<CountryObjct>()
    
    convenience init(id: String, name: String, image: String, shortTitle: String, story: String, countryList: List<CountryObjct> ) {
        self.init()
        self.id = id
        self.name = name
        self.image = image
        self.shortTitle = shortTitle
        self.story = story
        self.countryList = countryList
        
    }
}

class CountryObjct: Object {
    dynamic var name = ""
}
