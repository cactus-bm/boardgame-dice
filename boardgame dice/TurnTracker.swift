//
//  TurnTracker.swift
//  boardgame dice
//
//  Created by James Robinson on 01/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import SwiftUI

class Player {
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
}

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
        let stateModel = TurnTrackerStateModel()
        stateModel.players.append(Player(color: .blue))
        stateModel.players.append(Player(color: .orange))
        stateModel.players.append(Player(color: .white))
        stateModel.players.append(Player(color: .red))
        return VStack {
            TurnTracker(stateModel: stateModel)
            Button(action: stateModel.increment) {
                Text("Next")
            }
        }
    }
}
