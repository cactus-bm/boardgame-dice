//
//  RollTrackerStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation

let distribution: [Int] = [-2,3,3,-4,4,4,5,5,5,5,-6,6,6,6,6,7,7,7,7,7,7,-8,8,8,8,8,9,9,9,9,-10,10,10,11,11,-12]

class RollTrackerStateModel: ObservableObject {
    var rolls: [Int] = distribution.shuffled()
    
    func roll(turn: Int) -> Int {
        return abs(rolls[turn % rolls.count])
    }
    
    func isDouble(turn: Int) -> Bool {
        return rolls[turn % rolls.count] < 0
    }
    
    func shuffle() {
        rolls = distribution.shuffled()
    }
    
}
