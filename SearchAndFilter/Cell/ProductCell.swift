//
//  ProductCell.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 04/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    func fillCell(product:ProductModel) {
        imageView.sd_setImage(with: URL(string: product.image_url))
        nameLabel.text = product.name
        priceLabel.text = product.price
    }
}
