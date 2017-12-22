//
//  customButton.swift
//  Qrobat2
//
//  Created by hassan duhair on 8/23/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

@IBDesignable
class customButton: UIButton {

    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = .clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}


