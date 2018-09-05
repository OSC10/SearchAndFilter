//
//  ProductConnectionManager.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 04/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProductConnectionManager: NSObject {
    
    var products = [ProductModel]()
    var delegate: ProductConnectionManagerDelegate?
    var url = "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=10000&pmax=100000&wholesale=true&official=true&fshop=2&start=0&rows=10"
    
    func loadProduct() {
        
        Alamofire.request(url).response { response in
            if let data = response.data {
                let json = JSON(data)
                for (_,productJson) in json["data"] {
                    //Do something you want
                    let temp:ProductModel = ProductModel(json: productJson)
                    self.products.append(temp)
                }
                self.delegate?.connectionFinished(self)
            }
        }
    }
    
    func loadWithFilter(model:FilterModel) {
        products.removeAll()
        var whole: String
        var off: String
        var gold: String
        
        self.url = "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=" + model.minP + "&pmax=" + model.maxP + "&wholesale="
        
        if model.isWhole {
            whole = "true"
        } else {
            whole = "false"
        }
        self.url += whole + "&official="
        
        if model.isOfficial {
            off = "true"
        } else {
            off = "false"
        }
        self.url += off + "&fshop="
        
        if model.isGold {
            gold = "2"
        } else {
            gold = "0"
        }
        self.url += gold + "&start=0&rows=10"
        
        loadProduct()
    }
}
