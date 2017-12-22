//
//  ViewController.swift
//  Qrobat2
//
//  Created by hassan duhair on 8/21/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import SVProgressHUD
import RealmSwift
import Kingfisher

class MainVC: UIViewController {
    
    @IBOutlet weak var secendCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var categories : Results<Category>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getCategories()
        
        SVProgressHUD.dismiss()
        setUpNavBar()

        secendCollectionView.dataSource = self
        secendCollectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        cusomizeCollectionView(myCollectionView: secendCollectionView)
        
    }
    
    func getCategories(){
        let dbCategory = DBCategory()
        categories = dbCategory.getAllCategory()
    }
    
    func setUpNavBar(){
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logogo2")?.withRenderingMode(.alwaysOriginal)
        imageView.image = image
        navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    func cusomizeCollectionView(myCollectionView : UICollectionView){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (width / 2)-8, height: (myCollectionView.frame.size.height))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        myCollectionView.collectionViewLayout = layout
        
    }
    
    
    @IBAction func firstCategoryTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.category = categories[0]
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}


extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secendCollectionViewCell", for: indexPath) as! secendCollectionViewCell
        
        let category = categories[indexPath.row + 1]
        
        cell.titleLAbel.text = category.name
        cell.detailsLabel.text = category.shortTitle
        let url = URL(string: category.image)
        cell.mainImage.kf.setImage(with: url)
        cell.mainImage.contentMode = .scaleAspectFill
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.category = categories[indexPath.row+1]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension MainVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count - 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let category = categories[indexPath.row + 3]
        cell.titleLabel.text = category.name
        cell.detailsLabel.text = category.shortTitle
        let url = URL(string: category.image)
        cell.mainImage.kf.setImage(with: url)
        cell.mainImage.contentMode = .scaleAspectFill
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.category = categories[indexPath.row+3]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}














