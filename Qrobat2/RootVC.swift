//
//  RootVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/10/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import SideMenuController

class RootVC: SideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()

        performSegue(withIdentifier: "embedInitialCenterController", sender: nil)
        performSegue(withIdentifier: "embedSideController", sender: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

