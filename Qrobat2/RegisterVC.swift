//
//  RegisterVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Register"
        userNameTF.becomeFirstResponder()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        if let userName = userNameTF.text, !userName.isEmpty,
            let password = passwordTF.text, !password.isEmpty,
            let email = emailTF.text, !email.isEmpty,
            let country = countryTF.text, !country.isEmpty,
            let ageString = ageTF.text, !ageString.isEmpty,
            let phnString = phoneNumberTF.text, !phnString.isEmpty {
            
            guard let age = Int(ageString), let phoneNumber = Int(phnString) else {
                
                let alert = UIAlertController.alertWithTitle("", message: "you must enter a phone number and your age", buttonTitle: "OK")
                present(alert, animated: true, completion: nil)
                
                return
            }
            
            let user = User(userName: userName, password: password, email: email, age: age, country: country, phoneNumber: phoneNumber)
            
            let dbUser = DBUser()
            dbUser.addUser(user: user)
            
            let userInfo = ["userName" : userName,
                            "password" : password,
                            "age" : age,
                            "country" : country,
                            "email" : email,
                            "phoneNumber" : phoneNumber] as [String : Any]
            let userDefaults = UserDefaults.standard
            userDefaults.setValue(userInfo, forKey: "userInfo")
            
            let alert = UIAlertController(title: "Welcome", message: "you are register", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "RootVC")
                self.present(vc!, animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController.alertWithTitle("", message: "you must enter all the fields", buttonTitle: "OK")
            present(alert, animated: true, completion: nil)
        }
        
    }

}








