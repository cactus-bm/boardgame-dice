//
//  FrequencyCount.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import SwiftUI

let LEFT_BRAILLE: [String] = ["\u{2800}", "\u{2840}", "\u{28C0}", "\u{28C4}", "\u{28E4}", "\u{28E6}", "\u{28F6}"]
let RIGHT_BRAILLE: [String] = ["\u{2800}", "\u{2880}", "\u{28C0}", "\u{28E0}", "\u{28E4}", "\u{28F4}", "\u{28F6}"]

struct FrequencyCount: View {
    
    let roll: Int
    let count: Int
    
    var body: some View {
        VStack {
            Text(LEFT_BRAILLE[count]).scaledFont(name: "Georgia", size: 24)
            Text("\(roll)").scaledFont(name: "Georgia", size: 24)
        }.frame(width: roll < 10 ? 20 : 40, alignment: .center)
    }
}
struct FrequencyCount_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyCount(roll:1, count:2)
    }
}
