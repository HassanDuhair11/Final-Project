//
//  DBCountry.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import Foundation
import RealmSwift

class DBCountry {
    func getCountryList(country1: String? , country2: String?, country3: String?)->List<CountryObjct>{
        let countiesList = List<CountryObjct>()
        
        if let c1 = country1 {
            let c = CountryObjct()
            c.name = c1
            countiesList.append(c)
        }
        
        if let c2 = country2{
            let c = CountryObjct()
            c.name = c2
            countiesList.append(c)
        }
        
        if let c3 = country3 {
            let c = CountryObjct()
            c.name = c3
            countiesList.append(c)
        }

        return countiesList
    }
}
