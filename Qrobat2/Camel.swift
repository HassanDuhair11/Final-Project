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
    
    convenience init(image: String, status: String) {
        self.init(name: "camel", price: 300, image: image, about: "", status: status)
    }
    
    override func getPrice(ammount: Int) -> String{
        return "\(Int(price! + 0.5*price!) * ammount)"
    }
    
}

