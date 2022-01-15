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
    let alignment: Axis
    
    init(stateModel: TurnTrackerStateModel, alignment: Axis = .horizontal) {
        self.stateModel = stateModel
        self.alignment = alignment
    }
    
    var previous: some View {
        if let previous = stateModel.previous() {
            return Rectangle()
                .fill(previous.color)
                .frame(width: 40, height: 40)
                .border(Color.black)
        }
        else {
            return Rectangle()
                .fill(Color.black.opacity(0))
                .frame(width: 40, height: 40)
                .border(Color.black.opacity(0))
        }
    }
    
    var current: some View {
        Rectangle()
            .fill(stateModel.current().color)
            .frame(width: 80, height: 80)
            .border(Color.black)
    }
    
    var next: some View {
        Rectangle()
            .fill(stateModel.next().color)
            .frame(width: 40, height: 40)
            .border(Color.black)
    }
    
    var body: some View {
        switch self.alignment {
        case .horizontal :
            HStack {
                previous
                current
                next
            }
        case .vertical:
            VStack {
                previous
                current
                next
            }
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
