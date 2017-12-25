//
//  Subject.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/25/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class Subject{
    
    private var observerArray = [Observer]()
    private var _number = Int()
    
    var number : Int {
        set {
            _number = newValue
            notify()
        }
        get {
            return _number
        }
    }
    
    func attachObserver(observer: Observer){
        observerArray.append(observer)
    }
    
    private func notify(){
        for observer in observerArray {
            observer.update()
        }
    }
    
}
