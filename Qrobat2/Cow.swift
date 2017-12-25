//
//  File.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/21/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift

class Cow: Sacrifice {
    
    convenience init(image: String, status: String) {
        self.init(name: "cow", price: 200, image: image, about: "", status: status)
    }
    
    override func getPrice(ammount: Int) -> String{
        return "\(Int(price! + 0.4*price!)*ammount)"
    }
}
