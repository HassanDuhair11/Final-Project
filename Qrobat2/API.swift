//
//  API.swift
//  Qrobat
//
//  Created by hassan duhair on 8/16/17.
//  Copyright © 2017 eutd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class API  {
    
    
    class func getCountries(completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let url = URLs.countriesURL
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error)
                completion(error, false)
            case .success(let value):
                let json = JSON(value)
                let realm = try! Realm()
                
                for country in json {
                    let c = Country(json: country.1)
               //     print(c)
                    try! realm.write {
                        realm.add(c , update : true)
                    }
                }
                completion(nil, true)
            }
            
        }
        

    }


}








