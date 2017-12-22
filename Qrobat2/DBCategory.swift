//
//  DBCategory.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import Foundation
import RealmSwift

class DBCategory {
    
    public func addCategory(category: Category){
        let realmInstance = DBConnection.getDBConnection().getRealmInstance()
        
        try! realmInstance.write {
            realmInstance.add(category)
        }
    }
    
    public func getAllCategory() -> Results<Category> {
        let dbConecciton = DBConnection.getDBConnection().getRealmInstance()
        let categories = dbConecciton.objects(Category.self)
        return categories
    }

}
