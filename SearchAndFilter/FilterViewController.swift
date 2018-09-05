//
//  FilterViewController.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 05/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit
import MARKRangeSlider

class FilterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ShopViewControllerDelegate, ShopTypeDelegate {

    @IBOutlet var minimumPriceField: UITextField!
    @IBOutlet var maximumPriceField: UITextField!
    @IBOutlet var sliderView: MARKRangeSlider!
    @IBOutlet var shopTypeView: UICollectionView!
    @IBOutlet var wholeSwitch: UISwitch!
    
    var activeType = [String]()
    var delegate: FilterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sliderView.addTarget(self, action: #selector(self.rangeSliderValueChanged(slider:)), for: UIControlEvents.valueChanged)
        sliderView.setMinValue(100, maxValue: 10000000)
        sliderView.setLeftValue(100, rightValue: 10000000)
        
        sliderView.minimumDistance = 1000
        
        wholeSwitch.setOn(false, animated: false)
    }
    
    @IBAction func rangeSliderValueChanged(slider: MARKRangeSlider) {
        if slider.leftValue <= 100 {
            self.minimumPriceField.text = "100"
        } else {
            self.minimumPriceField.text = String(Int(slider.leftValue - slider.leftValue.truncatingRemainder(dividingBy: 1000)))
        }
        
        self.maximumPriceField.text = String(Int(slider.rightValue - slider.rightValue.truncatingRemainder(dividingBy: 1000)))
    }
    
    //MARK: shop type delegate
    
    func onApplyShopType(shop:[String]) {
        self.activeType = shop
        
        self.shopTypeView.reloadData()
    }
    
    //MARK: collection view delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activeType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopType", for: indexPath) as! ShopTypeCell
        
        let name = activeType[indexPath.item]
        
        cell.fillCell(name: name)
        cell.delegate = self
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 3
        
        return cell
    }
    
    //MARK: shop type delegate
    func onDelete(type: String) {
        if let index = activeType.index(of: type){
            self.activeType.remove(at:index)
        }
        self.shopTypeView.reloadData()
    }

    //MARK: action function
    @IBAction func onClickCancel(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickReset(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickShop(_ sender: UIButton) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "shop") as? ShopViewController {
            viewController.delegate = self
            viewController.activeFilter = activeType
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

    @IBAction func onClickApply(_ sender: UIButton) {
        let minPrice = self.minimumPriceField.text!
        let maxPrice = self.maximumPriceField.text!
        let model = FilterModel(minP: minPrice, maxP: maxPrice, isWhole: wholeSwitch.isOn, isOfficial: activeType.contains("Official Store"), isGold: activeType.contains("Gold Merchant"))
        
        self.delegate?.onApplyFilter(model: model)
        
        navigationController?.popViewController(animated: true)
    }
}
