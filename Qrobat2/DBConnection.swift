//
//  DBConnection.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import Foundation
import RealmSwift

class DBConnection {
    
    private static var aDbConnection: DBConnection?  // singlton pattern
    private var mainRealmInstance: Realm?
    
    private init() {
        mainRealmInstance = try! Realm()
    }
    
    public static func getDBConnection() -> DBConnection{
        if aDbConnection == nil {
            aDbConnection = DBConnection()
        }
        
        return aDbConnection!
    }
    
    public func getRealmInstance() -> Realm{
        return mainRealmInstance!
    }
    
}
