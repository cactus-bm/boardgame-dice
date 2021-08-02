//
//  PlayersStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation
import SwiftUI

class PlayersStateModel: ObservableObject {
        
    @Published var players: [Player] = [
        Player(color: .blue, isOn: true, sortOrder: 1),
        Player(color: .orange, isOn: true, sortOrder: 2),
        Player(color: .red, isOn: true, sortOrder: 3),
        Player(color: .white, isOn: false, sortOrder: 4),
        Player(color: .green, isOn: false, sortOrder: 6),
        Player(color: Color(.brown), isOn: false, sortOrder: 5)
    ]
    
    func count() -> Int {
        return players.filter({$0.isOn}).count
    }
    
    func index(_ at: Int) -> Player {
        return players.filter({$0.isOn})[at]
    }
    
    func reset() {
        self.players.shuffle()
    }
}
