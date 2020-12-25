//
//  PlayersStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation

class PlayersStateModel: ObservableObject {
    
    @Published var players: [Player] = [
        Player(color: .blue),
        Player(color: .orange),
        Player(color: .red),
        Player(color: .white)
    ]
    
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
