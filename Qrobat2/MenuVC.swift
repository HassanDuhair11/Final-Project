//
//  MenuVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 12/10/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let categories = ["Edit Account", "Delete Account", "Log out"]
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self // delegate desing pattern
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MenuVC: UITableViewDataSource, UITableViewDelegate { // Decerator design pattern
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: 10)
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            sideMenuController?.performSegue(withIdentifier: "showEdit", sender: self)
        case 1:
            let alert = UIAlertController(title: "", message: "are you sure ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "YES", style: .destructive, handler: { (action) in
                self.deleteAccount()
            }))
            alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        case 2:
            logOut()
        default:
            return
        }
        
    }
    
    func deleteAccount(){
        let userDeafults = UserDefaults.standard
        let userInfo = userDeafults.value(forKey: "userInfo") as! [String : Any]
        
        let userName = userInfo["userName"] as! String
        
        let dbUser = DBUser()
        dbUser.deleteUserWith(userName: userName)
     
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainVC")
        present(vc!, animated: true, completion: nil)
        
    }
    
    func logOut(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainVC")
        present(vc!, animated: true, completion: nil)
    }
    
}


/*
 
 dynamic var userName: String!
 dynamic var password: String!
 dynamic var email: String!
 dynamic var age = 0
 dynamic var country: String!
 dynamic var phoneNumber = 0
 
 */








