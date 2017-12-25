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
    @IBOutlet weak var productDataPickerView: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var sacrifice: Sacrifice?
    var sacrifices : [String] = [String]()
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        priceLabel.text = 0.description
        
        sacrifices = ["cow" , "lamb" , "camel"]
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
        self.priceLabel.text = sacrifice?.getPrice(ammount: Int(sender.value))
    }
    
    @IBAction func submetTapped(_ sender: Any) {
        let payCV = storyboard?.instantiateViewController(withIdentifier: "payVC") as! PayVC
        payCV.ammont = Int(priceLabel.text!)
        navigationController?.pushViewController(payCV, animated: true)
    }
}

extension DetailsVC : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return sacrifices.count
    }
    
}

extension DetailsVC : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sacrifices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let sacrificeFactory = SacrificeFactory()
        sacrifice = sacrificeFactory.getSacrifice(sacrificeType: sacrifices[row])
        priceLabel.text = sacrifice?.getPrice(ammount: 1)
    }
}














