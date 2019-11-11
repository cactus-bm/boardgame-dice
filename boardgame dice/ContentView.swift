//
//  ContentView.swift
//  catan dice
//
//  Created by James Robinson on 10/11/2019.
//  Copyright © 2019 James Robinson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let numberFont = 18.0
    let incrementFont = 9.0
    let decrementFont = 12.0
    let doubleFont = 1.0
    let turnFont = 2.0
    let resetFont = 3.0
    let rollFont = 5.0
    
    @State var rolls = [-2,3,3,-4,4,4,
             5,5,5,5,-6,6,
             6,6,6,7,7,7,
             7,7,7,-8,8,8,
             8,8,9,9,9,9,
        -10,10,10,11,11,-12].shuffled()
    
    @State var turn = 0
    
    @State var playerCount = 3
    
    var body: some View {
        VStack {
            Text("Turn \(self.turn + 1)").scaledFont(name: "Georgia", size: getSize(ratio: turnFont))
            Text("Roll \(self.turn % 31 + 1) / 31").scaledFont(name: "Georgia", size: getSize(ratio: rollFont))
            HStack {
                Button(action: removePlayer) {
                    Text("\u{2212}").scaledFont(name: "Georgia", size: getSize(ratio: decrementFont))
                }
                Text("Player \((turn % playerCount) + 1) / \(playerCount)").scaledFont(name: "Georgia", size: getSize(ratio: resetFont))
                Button(action: addPlayer) {
                    Text("+").scaledFont(name: "Georgia", size: getSize(ratio: incrementFont))
                }
            }
            Text("\(abs(rolls[turn % 31]))").scaledFont(name: "Georgia", size: getSize(ratio: numberFont))
            Text("\((rolls[turn % 31] < 0 ? "Double" : ""))").scaledFont(name: "Georgia", size: getSize(ratio: doubleFont))
            Button(action: roll) {
                Text("Roll").scaledFont(name: "Georgia", size: getSize(ratio: decrementFont))
            }
            Button(action: reset) {
                Text("Reset").scaledFont(name: "Georgia", size: getSize(ratio: resetFont))
            }
        }
    }
    
    func getSize(ratio: Double) -> CGFloat {
        return CGFloat(12.0 * ratio / 1000.0) * UIScreen.main.bounds.size.height
    }
    
    func reset() {
        rolls = rolls.shuffled()
        self.turn = 0
    }
    
    func addPlayer() {
        self.playerCount += 1
    }
    
    func removePlayer() {
        self.playerCount -= 1
        if self.playerCount < 2 {
            self.playerCount = 2
        }
    }
    
    func roll() {
        self.turn = self.turn + 1
        if self.turn % 31 == 0 {
            rolls = rolls.shuffled()
        }
    }
}

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
