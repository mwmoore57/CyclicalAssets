//
//  main.swift
//  CyclicalAssets
//
//  Created by Michael W. Moore on 12/26/19.
//  Copyright © 2019 BigNerdRanch. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
var alice: Person? = Person(name: "Alice")
print("created \(String(describing: bob))")
print("created \(String(describing: alice))")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45)

print("While Bob is alive, hat's owner is \(String(describing: hat!.owner))")
bob?.useNetWorthChangedHandler { netWorth in
    print("Bob's net worth is now \(netWorth)")
}
bob?.takeOwnership(of: laptop!)
alice?.takeOwnership(of: laptop!)
bob?.takeOwnership(of: hat!)
bob?.giveUpOwnership(of: hat!)
print("After Bob is deallocated, hat's owner is \(String(describing: hat!.owner))")

bob = nil
alice = nil
print("the bob variable is now \(String(describing: bob))")

laptop = nil
hat = nil
backpack = nil

