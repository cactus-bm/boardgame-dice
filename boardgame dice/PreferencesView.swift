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
    
    var players: some View {
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
        }
    }
    
    var audio: some View {
        VStack {
            Text("Audio")
            Toggle(isOn: $stateModel.audioOn) {
                Text("Speak dice rolls")
            }
            Toggle(isOn: $stateModel.namesOn) {
                Text("Speak names")
            }
        }
    }
    
    var dice: some View {
        VStack {
            Text("Dice")
            Toggle(isOn: $stateModel.rollRandomly) {
                Text("Roll Randomly")
            }
            Toggle(isOn: $stateModel.rollResetRandomly) {
                Text("Reset Randomly")
            }.disabled(stateModel.rollRandomly)
            Text("Rolls between reset: \(stateModel.shuffleAfter)")
            Picker("", selection: $stateModel.shuffleAfter) {
                ForEach(2 ..< 37, id: \.self) { i in
                    Text("\(i) Rolls").tag(i)
                }
            }.disabled(stateModel.rollRandomly || stateModel.rollResetRandomly)
            Toggle(isOn: $stateModel.resetCounterOnShuffle) {
                Text("Reset Tally on Shuffle")
            }.disabled(stateModel.rollRandomly)
        }
    }

    var body: some View {
        VStack {
            players
            audio
            dice
        }.frame(width: 300)
    }
}


struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(stateModel: GameStateModel())
    }
}
