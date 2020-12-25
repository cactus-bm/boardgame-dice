//
//  ContentView.swift
//  catan dice
//
//  Created by James Robinson on 10/11/2019.
//  Copyright © 2019 James Robinson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stateModel: GameStateModel
    let diceView: DiceView
    let preferencesView: PreferencesView
    
    init() {
        let stateModel = GameStateModel()
        diceView = DiceView(stateModel: stateModel)
        preferencesView = PreferencesView(stateModel: stateModel)
        self.stateModel = stateModel
    }
    
    var body: some View {
        ZStack {
            if self.stateModel.showPreferences {
                preferencesView
            }
            else {
                diceView
            }
            VStack {
                HStack(alignment: .top) {
                    Spacer()
                    Button(action: {
                        self.stateModel.showPreferences = !self.stateModel.showPreferences
                    }) {
                        if self.stateModel.showPreferences {
                            Image(systemName: "xmark").font(.system(size: 40.0))
                        }
                        else {
                            Image(systemName: "gear").font(.system(size: 40.0))
                        }
                    }.padding()
                }
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
