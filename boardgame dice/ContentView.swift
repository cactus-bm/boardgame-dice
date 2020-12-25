//
//  ContentView.swift
//  catan dice
//
//  Created by James Robinson on 10/11/2019.
//  Copyright © 2019 James Robinson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let stateModel: GameStateModel
    let diceView: DiceView
    
    init() {
        let stateModel = GameStateModel()
        diceView = DiceView(stateModel: stateModel)
        self.stateModel = stateModel
    }
    
    var body: some View {
        diceView
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
