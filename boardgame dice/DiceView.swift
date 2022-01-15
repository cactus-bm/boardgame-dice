//
//  DiceView.swift
//  boardgame dice
//
//  Created by James Robinson on 25/12/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import SwiftUI

struct DiceView: View {
    
    let numberFont = 18.0
    let incrementFont = 9.0
    let decrementFont = 12.0
    let doubleFont = 1.0
    let turnFont = 2.0
    let resetFont = 3.0
    let rollFont = 5.0
    
    @ObservedObject var stateModel: GameStateModel
    
    init(stateModel: GameStateModel) {
        self.stateModel = stateModel
    }
    
    var body: some View {
        VStack {
            Spacer()
            if stateModel.isTurn {
                FrequencyCounter(stateModel: stateModel.frequencyCounter).frame(width: 200,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            else {
                Rectangle()
                        .fill(Color.black.opacity(0))
                        .frame(width: 20, height: 50)
            }
            TurnTracker(stateModel: stateModel.turnTracker)
            Text(stateModel.rollValue).scaledFont(name: "Georgia", size: getSize(ratio: numberFont)).frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(stateModel.doubleText).scaledFont(name: "Georgia", size: getSize(ratio: doubleFont)).frame(width: 200, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Button(action: stateModel.roll) {
                Text(stateModel.rollAction).scaledFont(name: "Georgia", size: getSize(ratio: decrementFont)).frame(width: 400, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Button(action: stateModel.reset) {
                Text("Reset").scaledFont(name: "Georgia", size: getSize(ratio: resetFont))
            }
        }
    }
    
    func getSize(ratio: Double) -> CGFloat {
        return CGFloat(12.0 * ratio / 1000.0) * UIScreen.main.bounds.size.height
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(stateModel: GameStateModel())
    }
}
