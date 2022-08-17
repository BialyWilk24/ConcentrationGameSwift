//
//  Card.swift
//  Concentration
//
//  Created by Максим on 11.08.2022.
//

import Foundation



struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var ID: Int
    
    static var IDNumber = 0
    
    static func IDGenerator() -> Int {
        IDNumber += 1
        return IDNumber
    }
    
    init() {
        self.ID = Card.IDGenerator()
    }
}
