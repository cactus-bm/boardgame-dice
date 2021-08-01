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
            ForEach(stateModel.turnTracker.players.players.sorted(by: { $0.sortOrder < $1.sortOrder })) { player in
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 42, height: 42)
                        Rectangle()
                            .fill(player.color)
                            .frame(width: 40, height: 40)
                    }
                    TextField("", text: .init(
                        get: { player.name },
                        set: { player.name = $0 }
                    ))
                    Toggle(isOn: .init(
                            get: { player.isOn },
                            set: { player.isOn = $0 })
                    ) {}
                }
            }
            Text("Audio")
            Toggle(isOn: $stateModel.audioOn) {
                Text("Speak dice rolls")
            }
            Toggle(isOn: $stateModel.namesOn) {
                Text("Speak names")
            }
        }.frame(width: 300)
    }
}


struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(stateModel: GameStateModel())
    }
}
