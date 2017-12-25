//
//  Sacrifice .swift
//  Qrobat2
//
//  Created by hassan duhair on 12/21/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift

class Sacrifice: Object {
    var name: String?
    var price: Double?
    var image: String?
    var about: String?
    var status: String?
    
    convenience init(name: String, price: Double, image: String, about: String, status: String) {
        self.init()
        self.name = name
        self.price = price
        self.image = image
        self.about = about
        self.status = status
    }
    
    func getPrice(ammount: Int) -> String{
        return ""
    }
}
