//
//  DBUser.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import Foundation
import Realm

class DBUser {
    
    public func addUser(user: User){
        let realmInstance = DBConnection.getDBConnection().getRealmInstance()
        
        try! realmInstance.write {
            realmInstance.add(user, update: true)
        }
    }
    
    public func isUserRegister(userName: String, password: String, completion:(_ isRegister: Bool, _ user: User?)->Void){
        let realmInstance = DBConnection.getDBConnection().getRealmInstance()
        let user = realmInstance.objects(User.self).filter("userName = '\(userName)' AND password = '\(password)'").first
    
        if let u = user {
            completion(true, u)
        }else{
            completion(false, nil)
        }
        
    }
    
    public func deleteUserWith(userName: String){
        let realmInstance = DBConnection.getDBConnection().getRealmInstance()
   
        try! realmInstance.write {
            realmInstance.delete(realmInstance.object(ofType: User.self, forPrimaryKey: userName)!)
        }
    }
}











