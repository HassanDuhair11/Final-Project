//
//  SacrificeFactory .swift
//  Qrobat2
//
//  Created by hassan duhair on 12/22/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class SacrificeFactory {
    func getSacrifice(sacrificeType: String)->Sacrifice?{

        if(sacrificeType == ""){
            return nil
        }
        if(sacrificeType == "lamb"){
            return lamb()
            
        } else if(sacrificeType == "camel"){
            return Camel()
            
        } else if(sacrificeType == "cow"){
            return Cow()
        }
        
        return nil
    }
}
