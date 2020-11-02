//
//  GameStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation

class GameStateModel {
    let players: PlayersStateModel
    let turnTracker: TurnTrackerStateModel
    let frequencyCounter: FrequencyCounterStateModel
    let rollTracker: RollTrackerStateModel
    var settingsMode: Bool = false
    
    init() {
        self.players = PlayersStateModel()
        self.turnTracker = TurnTrackerStateModel(players: self.players)
        self.rollTracker = RollTrackerStateModel()
        self.frequencyCounter = FrequencyCounterStateModel()
    }
}
