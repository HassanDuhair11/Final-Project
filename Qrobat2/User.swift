//
//  User.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    dynamic var userName: String!
    dynamic var password: String!
    dynamic var email: String!
    dynamic var age = 0
    dynamic var country: String!
    dynamic var phoneNumber = 0
    
    convenience init(userName: String, password: String, email: String, age: Int, country: String, phoneNumber: Int) {
        self.init() //Please note this says 'self' and not 'super'
        self.userName = userName
        self.password = password
        self.email = email
        self.age = age
        self.country = country
        self.phoneNumber = phoneNumber
    }
    
    override static func primaryKey() -> String? {
        return "userName"
    }
    
}

