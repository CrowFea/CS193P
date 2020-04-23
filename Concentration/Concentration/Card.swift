//
//  Card.swift
//  Concentration
//
//  Created by 晨风 on 2020/4/23.
//  Copyright © 2020 crowfea. All rights reserved.
//

import Foundation

class Card{
    var isFacedUp = false
    var isMathced = false
    var identifier : Int
    
    static identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier:Int){
        self.identifier = getUniqueIdentifier()
    }
}
