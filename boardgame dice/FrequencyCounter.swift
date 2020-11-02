//
//  FrequencyCounter.swift
//  boardgame dice
//
//  Created by James Robinson on 01/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import SwiftUI


let LEFT_BRAILLE: [String] = ["\u{2800}", "\u{2840}", "\u{28C0}", "\u{28C4}", "\u{28E4}", "\u{28E6}", "\u{28F6}"]
let RIGHT_BRAILLE: [String] = ["\u{2800}", "\u{2880}", "\u{28C0}", "\u{28E0}", "\u{28E4}", "\u{28F4}", "\u{28F6}"]

struct FrequencyCount: View {
    
    let roll: Int
    let count: Int
    
    var body: some View {
        VStack {
            if roll < 7 {
                Text(RIGHT_BRAILLE[count]).scaledFont(name: "Georgia", size: 12)
            }
            else {
                Text(LEFT_BRAILLE[count]).scaledFont(name: "Georgia", size: 12)
            }
            Text("\(roll)").frame(width: 15, alignment: .center).scaledFont(name: "Georgia", size: 12)
        }
    }
}

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
