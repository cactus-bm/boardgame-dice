//
//  FrequencyCounterStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation

class FrequencyCounterStateModel: ObservableObject {
    
    @Published var frequency: [Int] = [0,0,0,0,0,0,0,0,0,0,0]
    
    func setRoll(roll: Int, value: Int) {
        frequency[roll - 2] = value
    }
    
    func getRoll(roll: Int) -> Int {
        return frequency[roll - 2]
    }
    
    func increment(roll: Int) {
        self.setRoll(roll: roll, value: self.getRoll(roll: roll) + 1)
    }
    
    func reset() {
        for roll in 2...12 {
            self.setRoll(roll: roll, value: 0)
        }
    }
}
