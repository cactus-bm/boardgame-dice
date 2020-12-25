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

    let stateModel: GameStateModel

    init(stateModel: GameStateModel) {
        self.stateModel = stateModel
    }

    var body: some View {
        Text("Preferences")
    }
}

