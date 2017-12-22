//
//  DetailsVC.swift
//  Qrobat2
//
//  Created by hassan duhair on 8/23/17.
//  Copyright © 2017 euted. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var story: UILabel!
    @IBOutlet weak var ammountTextLabel: UILabel!
    @IBOutlet weak var productDataPickerView:
    UIPickerView!
    var products : [String] = [String]()
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = ["cow" , "lamp" , "camel"]
        productDataPickerView.dataSource = self
        productDataPickerView.delegate = self

        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true

        if let c = category {
            self.navigationItem.title = c.name
            let url = URL(string: c.image)
            imageView.kf.setImage(with: url)
            imageView.contentMode = .scaleAspectFill
            story.text = c.story!
        }
    }

    @IBAction func ammountStepperTapped(_ sender: UIStepper) {
        self.ammountTextLabel.text = Int(sender.value).description
    }
}

extension DetailsVC : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return products.count
    }
    
}

extension DetailsVC : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return products[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
}










