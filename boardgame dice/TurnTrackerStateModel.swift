//
//  TurnTrackerStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation


class TurnTrackerStateModel: ObservableObject {
    @Published var turn: Int = 0
    var players: [Player] = []
    
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
        if turn < players.count || turn >= 2 * players.count {
            return players[turn % players.count]
        }
        return players[(2 * players.count - turn - 1) % players.count]
    }
    
    func text() -> String {
        if (self.turn >= players.count * 2) {
            return "Turn \(self.turn - self.players.count * 2 + 1)"
        }
        else if (self.turn >= players.count) {
            return "Second Settlement and Road"
        }
        else {
            return "First Settlement and Road"
        }
    }
    
    func increment() {
        self.turn += 1
    }
}
