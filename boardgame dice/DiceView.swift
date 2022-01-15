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
    let rollFont = 20.0
    
    @ObservedObject var stateModel: GameStateModel
    
    init(stateModel: GameStateModel) {
        self.stateModel = stateModel
    }
    
    var buttons: some View {
        VStack(alignment: .center)  {
            Button(action: stateModel.roll) {
                Text(stateModel.rollAction).scaledFont(name: "Georgia", size: getSize(ratio: decrementFont)).frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Button(action: stateModel.reset) {
                Text("Reset").scaledFont(name: "Georgia", size: getSize(ratio: resetFont))
            }
        }
    }
    
    func isPortrait(_ geometry: GeometryProxy) -> Bool {
        return geometry.size.height > 900 || geometry.size.width < geometry.size.height
    }
    
    var roll: some View {
        GeometryReader { (geometry) in
            let rollFrameHeight = min(300, geometry.size.height - 60)
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .center) {
                    Text(stateModel.turnTracker.text()).frame(height:40)
                    Text(stateModel.rollValue)
                        .scaledFont(name: "Georgia", size: getSizeInFrame(ratio: rollFont, height: rollFrameHeight, frame: 300))
                        .frame(width: rollFrameHeight, height: rollFrameHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(stateModel.doubleText).scaledFont(name: "Georgia", size: 12).frame(height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
        }.frame(maxHeight: 360)
    }
    
    var body: some View {
        GeometryReader { (geometry) in
            VStack {
                Spacer()
                if isPortrait(geometry) {
                    if stateModel.isTurn {
                        FrequencyCounter(stateModel: stateModel.frequencyCounter).frame(width: 200,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    TurnTracker(stateModel: stateModel.turnTracker)
                    roll
                    buttons
                }
                else {
                    HStack {
                        TurnTracker(stateModel: stateModel.turnTracker, alignment: .vertical)
                        roll
                        buttons
                    }
                }
                Spacer()
            }
        }
    }
    
    func getSize(ratio: Double) -> CGFloat {
        return CGFloat(12.0 * ratio / 1000.0) * UIScreen.main.bounds.size.height
    }
    
    func getSizeInFrame(ratio: Double, height: Double, frame: Double) -> CGFloat {
        return CGFloat(12.0 * ratio / frame) * height
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(stateModel: GameStateModel())
    }
}
