//
//  ShopTypeCell.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 06/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit

class ShopTypeCell: UICollectionViewCell {
    
    var delegate: ShopTypeDelegate?
    
    @IBOutlet var shopTypeLabel: UILabel!
    
    func fillCell(name:String) {
        shopTypeLabel.text = name
    }
    
    @IBAction func onClickDelete(_ sender: UIButton) {
        self.delegate?.onDelete(type: shopTypeLabel.text!)
    }
}
