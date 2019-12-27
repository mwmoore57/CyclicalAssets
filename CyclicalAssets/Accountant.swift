//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Michael W. Moore on 12/26/19.
//  Copyright © 2019 BigNerdRanch. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Int) -> Void
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Int = 0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gained(_ asset: Asset, completion: () -> Void ) {
        netWorth += asset.value
        completion()
    }
    
    func lost(_ asset: Asset, completion: () -> Void ) {
        netWorth -= asset.value
        completion()
    }
}
