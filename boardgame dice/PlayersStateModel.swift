//
//  PlayersStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation

class PlayersStateModel {
    
    var players: [Player] = []
    
    func count() -> Int {
        return players.count
    }
    
    func index(_ at: Int) -> Player {
        return players[at]
    }
    
    func add(player: Player) {
        players.append(player)
    }
}
