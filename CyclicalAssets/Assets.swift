//
//  Assets.swift
//  CyclicalAssets
//
//  Created by Michael W. Moore on 12/26/19.
//  Copyright © 2019 BigNerdRanch. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible, Equatable {
    let name: String
    let value: Int // value rounded to nearest dollar
    // Must create a weak reference to avoid a strong reference cycle
    weak var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by \(actualOwner))"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone)"
        }
    }
    
    init(name: String, value: Int) {
        self.name = name
        self.value = value
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    static func ==(lhs: Asset, rhs: Asset) -> Bool {
        return (lhs.name == rhs.name) && (lhs.value == rhs.value)
    }
}
