//
//  Lamb.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/21/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift

class lamb: Sacrifice{

    convenience init(image: String, status: String) {
        self.init(name: "lamb", price: 100, image: image, about: "", status: status)
    }
    
    override func getPrice(ammount: Int) -> String{
        return "\(Int(price! + 0.3*price!)*ammount)"
    }

}
