//
//  SignInVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/7/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignInVC: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func signInTapped(_ sender: UIButton) {
        
        guard let userName = userNameTF.text?.trimmingCharacters(in: .whitespaces), !userName.isEmpty, let password = passwordTF.text?.trimmingCharacters(in: .whitespaces), !password.isEmpty else{
           
            let alert = UIAlertController(title: "alert", message: "username or password is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        let dbUser = DBUser()
        dbUser.isUserRegister(userName: userName, password: password) { (isRegister: Bool, user: User?) in
            
            if isRegister {
        
                SVProgressHUD.show()
                let vc = storyboard?.instantiateViewController(withIdentifier: "RootVC")
 
                print("hellow \(user!.email!)")
                
                let userInfo = ["userName" : user!.userName!,
                                "password" : user!.password,
                                "age" : user!.age,
                                "country" : user!.country,
                                "email" : user!.email,
                                "phoneNumber" : user!.phoneNumber] as [String : Any]
                let userDefaults = UserDefaults.standard
                userDefaults.setValue(userInfo, forKey: "userInfo")
                // save user to user deafults
                
                present(vc!, animated: true, completion: nil)
                
            }else{
     
                //show alert to user to register to the system
                let alert = UIAlertController(title: "", message: "you must register to the system", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.performSegue(withIdentifier: "showRegister", sender: self)
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
                
                userNameTF.text = ""
                passwordTF.text = ""
                
                present(alert, animated: true, completion: nil)

            }
            
        }
    }
}





