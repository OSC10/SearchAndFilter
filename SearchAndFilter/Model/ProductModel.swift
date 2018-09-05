//
//  ProductModel.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 04/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductModel: NSObject {
    var price: String
    var name : String
    var image_url : String
    
    init(json:JSON) {
        self.price = json["price"].stringValue
        self.name = json["name"].stringValue
        self.image_url = json["image_uri"].stringValue
    }
    
    init(price: String, name: String, image_url: String) {
        self.price = price
        self.name = name
        self.image_url = image_url
    }
}
