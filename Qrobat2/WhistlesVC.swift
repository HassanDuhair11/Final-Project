//
//  WhistlesVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 8/23/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class WhistlesVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpnavBar()
    
    }
    
    
    func setUpnavBar(){
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(backButtonTapped))
        backBarButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logogo2")
        imageView.image = image
        navigationItem.titleView = imageView
        
    }
    
    func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }



}
