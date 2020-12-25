//
//  PreferencesView.swift
//  boardgame dice
//
//  Created by James Robinson on 25/12/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation

import SwiftUI

struct PreferencesView: View {

    @ObservedObject var stateModel: GameStateModel

    init(stateModel: GameStateModel) {
        self.stateModel = stateModel
    }

    var body: some View {
        VStack {
            Text("Players")
            ForEach(0 ..< stateModel.turnTracker.players.players.count) { playerIndex in
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 42, height: 42)
                        Rectangle()
                            .fill(stateModel.turnTracker.players.players[playerIndex].color)
                            .frame(width: 40, height: 40)
                    }
                    Spacer()
                    Toggle(isOn: $stateModel.turnTracker.players.players[playerIndex].isOn) {}
                }
            }
            Text("Audio")
            Toggle(isOn: $stateModel.audioOn) {
                Text("Speak dice rolls")
            }
        }.frame(width: 300)
    }
}


struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(stateModel: GameStateModel())
    }
}
