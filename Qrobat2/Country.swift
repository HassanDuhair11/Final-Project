//
//  Country.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/21/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift

class Country: Object {
    
    dynamic var countryName: String?
    dynamic var countryImage: String?
    dynamic var lamb: lamb?
    dynamic var camel: Camel?
    dynamic var cow: Cow?
    
    convenience required init(countryName: String, countryImage: String, lamb: lamb, camel: Camel, cow: Cow) {
        self.init()
        self.countryName = countryName
        self.countryImage = countryImage
        self.lamb = lamb
        self.camel = camel
        self.cow = cow
    }

}
