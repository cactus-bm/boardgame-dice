//
//  FrequencyCounter.swift
//  boardgame dice
//
//  Created by James Robinson on 01/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import SwiftUI


struct FrequencyCounter: View {
    
    let stateModel: FrequencyCounterStateModel
    
    init(stateModel: FrequencyCounterStateModel) {
        self.stateModel = stateModel
    }
    
    var body: some View {
        HStack {
            ForEach((2...12), id: \.self) {
                FrequencyCount(roll: $0, count: stateModel.getRoll(roll: $0))
            }
        }
    }
}

struct FrequencyCounter_Previews: PreviewProvider {
    static var previews: some View {
        let stateModel = FrequencyCounterStateModel()
        stateModel.setRoll(roll: 2,value: 1)
        stateModel.setRoll(roll: 3,value: 2)
        stateModel.setRoll(roll: 4,value: 3)
        stateModel.setRoll(roll: 5,value: 4)
        stateModel.setRoll(roll: 6,value: 5)
        stateModel.setRoll(roll: 7,value: 6)
        stateModel.setRoll(roll: 8,value: 5)
        stateModel.setRoll(roll: 9,value: 4)
        stateModel.setRoll(roll: 10,value: 3)
        stateModel.setRoll(roll: 11,value: 2)
        stateModel.setRoll(roll: 12,value: 1)
        return FrequencyCounter(stateModel: stateModel)
    }
}
