//
//  TurnTracker.swift
//  boardgame dice
//
//  Created by James Robinson on 01/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import SwiftUI

struct TurnTracker: View {
    
    @ObservedObject var stateModel: TurnTrackerStateModel
    
    init(stateModel: TurnTrackerStateModel) {
        self.stateModel = stateModel
    }
    
    var body: some View {
        VStack {
            HStack {
                if let previous = stateModel.previous() {
                    Rectangle()
                        .fill(previous.color)
                        .frame(width: 20, height: 20)
                }
                else {
                    Rectangle()
                        .fill(Color.black.opacity(0))
                        .frame(width: 20, height: 20)
                }
                Rectangle()
                    .fill(stateModel.current().color)
                    .frame(width: 40, height: 40)
                Rectangle()
                    .fill(stateModel.next().color)
                    .frame(width: 20, height: 20)
            }
            Text(stateModel.text())
        }
    }
}

struct TurnTracker_Previews: PreviewProvider {
    static var previews: some View {
        let players = PlayersStateModel()
        let stateModel = TurnTrackerStateModel(players: players)
        return VStack {
            TurnTracker(stateModel: stateModel)
            Button(action: stateModel.increment) {
                Text("Next")
            }
        }
    }
}
