//
//  SacrificeFactory .swift
//  Qrobat2
//
//  Created by hassan duhair on 12/22/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class SacrificeFactory {
    func getSacrifice(sacrificeType: String) -> Sacrifice?{

        if(sacrificeType == ""){
            return nil
        }
        if(sacrificeType == "lamb"){
            return lamb.init(image: "image", status: "status")
            
        } else if(sacrificeType == "camel"){
            return Camel.init(image: "image", status: "status")
            
        } else if(sacrificeType == "cow"){
            return Cow.init(image: "image", status: "status")
        }
        
        return nil
    }
}
