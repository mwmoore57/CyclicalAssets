//
//  Person.swift
//  CyclicalAssets
//
//  Created by Michael W. Moore on 12/26/19.
//  Copyright © 2019 BigNerdRanch. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in   // must declare self to be weak in capture list
            //necassary in order to avoid a stong reference cycle
            self?.netWorthDidChange(to: netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnership(of asset: Asset) {
        if asset.owner == nil {
            accountant.gained(asset) {
                asset.owner = self
                assets.append(asset)
            }
        } else {
            print("Sorry but \(self) can't have that asset. It's already owned by another person: \(asset.owner!)")
        }
        
    }
    
    func giveUpOwnership(of asset: Asset) {
        accountant.lost(asset) {
            asset.owner = nil
            let index = assets.firstIndex(of: asset)
            assets.remove(at: index ?? 0)
        }
    }
    
    func netWorthDidChange(to netWorth: Int) {
        print("The net worth of \(self) is now \(netWorth)")
    }
    
    func useNetWorthChangedHandler(handler: @escaping (Int) -> Void) {
        accountant.netWorthChangedHandler = handler
    }
}
