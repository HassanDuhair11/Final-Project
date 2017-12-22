//
//  camel.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/21/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift

class Camel: Sacrifice {
    
    convenience init(name: String, price: Double, image: String, about: String, status: String) {
        self.init(name: name, price: price, image: image, about: about, status: status)
    }
    
    override func getPrice() -> String{
        return "\(price! * 0.9)"
    }
    
}

