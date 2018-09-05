//
//  FilterViewController.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 05/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit
import MARKRangeSlider

class FilterViewController: UIViewController {

    @IBOutlet var minimumPriceField: UITextField!
    @IBOutlet var maximumPriceField: UITextField!
    @IBOutlet var sliderView: MARKRangeSlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sliderView.addTarget(self, action: #selector(self.rangeSliderValueChanged(slider:)), for: UIControlEvents.valueChanged)
        sliderView.setMinValue(100, maxValue: 10000000)
        sliderView.setLeftValue(100, rightValue: 10000000)
        
        sliderView.minimumDistance = 1000
    }
    
    @IBAction func rangeSliderValueChanged(slider: MARKRangeSlider) {
        if slider.leftValue <= 100 {
            self.minimumPriceField.text = "100"
        } else {
            self.minimumPriceField.text = String(Int(slider.leftValue - slider.leftValue.truncatingRemainder(dividingBy: 1000)))
        }
        
        self.maximumPriceField.text = String(Int(slider.rightValue - slider.rightValue.truncatingRemainder(dividingBy: 1000)))
    }

    //MARK: action function
    @IBAction func onClickCancel(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickReset(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickShop(_ sender: UIButton) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "shop") as? ShopViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

    @IBAction func onClickApply(_ sender: UIButton) {
        
    }
}
