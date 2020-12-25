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
        Player(color: .blue, isOn: true),
        Player(color: .orange, isOn: true),
        Player(color: .red, isOn: true),
        Player(color: .white, isOn: false),
        Player(color: .green, isOn: false),
        Player(color: Color(.brown), isOn: false)
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
