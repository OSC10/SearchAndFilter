//
//  FilterModel.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 06/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit

class FilterModel: NSObject {
    var minP : String
    var maxP : String
    var isWhole : Bool
    var isOfficial: Bool
    var isGold: Bool
    
    init(minP: String, maxP: String, isWhole: Bool, isOfficial: Bool, isGold: Bool) {
        self.minP = minP
        self.maxP = maxP
        self.isWhole = isWhole
        self.isOfficial = isOfficial
        self.isGold = isGold
    }
}
