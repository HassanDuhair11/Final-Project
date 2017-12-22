//
//  EditAccountVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/10/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class EditAccountVC: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    let userDeafults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         
         "userName" : oldUserName,
         "password" : password,
         "age" : age,
         "country" : country,
         "email" : email,
         "phoneNumber" : phoneNumber
         
         */

        let userInfo = userDeafults.value(forKey: "userInfo") as! [String : Any]
        passwordTF.text = userInfo["password"] as? String
        emailTF.text = userInfo["email"] as? String
        ageTF.text = String(userInfo["age"] as! Int)
        countryTF.text = userInfo["country"] as? String
        phoneNumberTF.text = String(userInfo["phoneNumber"] as! Int)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "alert", message: "are you sure", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            self.editAccount()
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func editAccount(){
     
        if let password = passwordTF.text, !password.isEmpty,
           let email = emailTF.text, !email.isEmpty,
           let country = countryTF.text, !country.isEmpty,
           let ageString = ageTF.text, !ageString.isEmpty,
           let phnString = phoneNumberTF.text, !phnString.isEmpty {
           
            guard let age = Int(ageString), let phoneNumber = Int(phnString) else {
                
                let alert = UIAlertController.alertWithTitle("", message: "you must enter a phone number and your age", buttonTitle: "OK")
                present(alert, animated: true, completion: nil)

                return
            }
        
            let userInfo = userDeafults.value(forKey: "userInfo") as! [String : Any]
            let oldUserName = userInfo["userName"] as! String
            print("\(userInfo["userName"] as! String) is the old usernanme")
            
            let newUser = User(userName: oldUserName, password: password, email: email, age: age, country: country, phoneNumber: phoneNumber)
            
            let dbUser = DBUser()
            dbUser.addUser(user: newUser)
            
            let editedUserInfo = ["userName" : oldUserName,
                            "password" : password,
                            "age" : age,
                            "country" : country,
                            "email" : email,
                            "phoneNumber" : phoneNumber] as [String : Any]
            
            userDeafults.setValue(editedUserInfo, forKey: "userInfo")
            
            print("the editing done")

            self.dismiss(animated: true, completion: nil)
        
        }else{
            let alert = UIAlertController.alertWithTitle("", message: "you must enter all the fields", buttonTitle: "OK")
            present(alert, animated: true, completion: nil)
        }
        
    }

}









