//
//  PayVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/11/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift

class PayVC: UIViewController {

    var ammont: Int?

    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var agreeSquerLabel: UIView!
    @IBOutlet weak var ammountLabel: UILabel?
    
    @IBOutlet weak var cardNumberTF: UITextField!
    @IBOutlet weak var cardPasswordTF: UITextField!
    @IBOutlet weak var adressTF: UITextField!
    @IBOutlet weak var zipNumberTF: UITextField!
    
    
    var isAgree = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAgree()
        
        if let a = ammont{
            ammountLabel?.text = "\(a.description) $"
        }
    }
    
    func setUpAgree(){
        agreeLabel.isUserInteractionEnabled = true
        agreeSquerLabel.layer.borderWidth = 1
        agreeSquerLabel.layer.cornerRadius = agreeSquerLabel.frame.height/2
        agreeSquerLabel.backgroundColor = .white
        agreeSquerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(squreTapped)))
        agreeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(squreTapped)))
    }
    
    func squreTapped(){
        if !isAgree {
            self.isAgree = true
            UIView.animate(withDuration: 0.3, animations: { 
                self.agreeSquerLabel.backgroundColor = .blue
            })
        }else{
            self.isAgree = false
            UIView.animate(withDuration: 0.3, animations: {
                self.agreeSquerLabel.backgroundColor = .white
            })
        }
    }
    
    @IBAction func payButtonTapped(_ sender: Any) {
        guard let cardNumber = cardNumberTF.text?.trimmingCharacters(in: .whitespaces), !cardNumber.isEmpty,
              let cardPassword = cardPasswordTF.text?.trimmingCharacters(in: .whitespaces), !cardPassword.isEmpty, let adress = adressTF.text?.trimmingCharacters(in: .whitespaces), !adress.isEmpty,
              let zipNumber = zipNumberTF.text?.trimmingCharacters(in: .whitespaces), !zipNumber.isEmpty else {
            
                let alert = UIAlertController(title: "", message: "all feilds must enterd", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
        }
        
        print(cardNumber)
        
        
    }
    
}





