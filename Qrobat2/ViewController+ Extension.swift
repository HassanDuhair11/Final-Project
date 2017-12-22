//
//  ViewController+ Extension.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/18/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func alertWithTitle(_ title: String, message: String, buttonTitle: String) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(action)
        
        return alertController
    }
}

