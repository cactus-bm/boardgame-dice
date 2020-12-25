//
//  TurnTrackerStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation
import SwiftUI


class TurnTrackerStateModel: ObservableObject {
    @Published var turn: Int = 0
    @ObservedObject var players: PlayersStateModel
    
    init(players: PlayersStateModel) {
        self.players = players
    }
    
    func current() -> Player {
        return getPlayer(turn: turn)!
    }
    
    func previous() -> Player? {
        return getPlayer(turn: turn - 1)
    }
    
    func next() -> Player {
        return getPlayer(turn: turn + 1)!
    }
    
    func getPlayer(turn: Int) -> Player? {
        if turn < 0 {
            return nil
        }
        if turn < players.count() || turn >= 2 * players.count() {
            return players.index(turn % players.count())
        }
        return players.index((2 * players.count() - turn - 1) % players.count())
    }
    
    func isTurn() -> Bool {
        return self.turn >= players.count() * 2
    }
    
    func nextIsTurn() -> Bool {
        return self.turn + 1 >= players.count() * 2
    }
    
    func turnIndex() -> Int {
        return self.turn - self.players.count() * 2
    }
    
    func text() -> String {
        if isTurn() {
            return "Turn \(turnIndex() + 1)"
        }
        else if (self.turn >= players.count()) {
            return "Second Settlement and Road"
        }
        else {
            return "First Settlement and Road"
        }
    }
    
    func increment() {
        self.turn += 1
    }
    
    func reset() {
        self.turn = 0
        self.players.reset()
    }
}
