//
//  ShopTableViewCellDelegate.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 05/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit

protocol ShopTableViewCellDelegate {
    
    func shopOnCheck(shop: String, isChecked: Bool)
    
}
