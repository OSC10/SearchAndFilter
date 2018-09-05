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
    
    func loadProduct() {
        
        Alamofire.request("https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=10000&pmax=100000&wholesale=true&official=true&fshop=2&start=0&rows=10").response { response in
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
}
