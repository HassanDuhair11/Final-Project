//
//  DetailsVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 8/22/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher
import SVProgressHUD


class CountriesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var result : Results<Country>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpNavBar()
        
        SVProgressHUD.setBackgroundColor(.gray)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.show()
        
        API.getCountries { (error, success) in
            if success {
                self.collectionView.reloadData()
                SVProgressHUD.dismiss()
            }
        }
        
        let realm = try! Realm()
        result = realm.objects(Country.self)
        
        cusomizeCollectionView(myCollectionView: collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func cusomizeCollectionView(myCollectionView : UICollectionView){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: (width / 2)-15, height: (myCollectionView.frame.size.height/3))
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        myCollectionView.collectionViewLayout = layout
        
    }
    
    
    
    func setUpNavBar(){
    
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action:#selector(backButtonTapped))
        backBarButtonItem.tintColor = .black
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "shopping-cart") , style: .plain, target: self, action: #selector(shoppingTapped))
        leftBarButton.tintColor = .black

        self.navigationItem.leftBarButtonItems = [backBarButtonItem , leftBarButton]

        let menuBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu (4)"), style: .plain, target: self, action:#selector(menuTapped))
        menuBarButtonItem.tintColor = .black
        
        self.navigationItem.rightBarButtonItem  = menuBarButtonItem
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logogo2")
        imageView.image = image
        navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.shadowImage = UIImage()

    } 
    
    func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func menuTapped()  {
        print("menuTApped")
    }
    
    func shoppingTapped(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "WhistlesVC") as! WhistlesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension CountriesVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if result.count == 0 {
            return 0
        }else{
            return result.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! countyCollectionViewCell
        let c = result[indexPath.row]
        cell.countryNameLabel.text = c.country_nameEn
        let url = URL(string: c.country_image)
        cell.flagImageView.kf.setImage(with: url , options: [.transition(ImageTransition.flipFromTop(1.0))], progressBlock: nil , completionHandler: nil)
        cell.flagImageView.layer.borderWidth = 0.5
        cell.flagImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        // cell.lampPriceLabel.text = c.lamb_price+"$"
        // cell.camelPriceLabel.text = c.camel_price+"$"
        // cell.cowPriceLabel.text = c.cow_price+"$"
        
        return cell
    }
}

extension CountriesVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}








