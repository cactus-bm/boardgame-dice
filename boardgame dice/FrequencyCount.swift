//
//  FrequencyCount.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import SwiftUI

let LEFT_BRAILLE: [String] = ["\u{2800}", "\u{2840}", "\u{28C0}", "\u{28C4}", "\u{28E4}", "\u{28E6}", "\u{28F6}", "\u{28F7}", "\u{28FF}"]
let RIGHT_BRAILLE: [String] = ["\u{2800}", "\u{2880}", "\u{28C0}", "\u{28E0}", "\u{28E4}", "\u{28F4}", "\u{28F6}", "\u{28FE}", "\u{28FF}"]

struct FrequencyCount: View {
    
    let roll: Int
    let count: Int
    
    
    var body: some View {
        let braile = roll > 7 ? LEFT_BRAILLE : RIGHT_BRAILLE
        VStack(alignment: .center) {
            ForEach((0...count/8).reversed(), id: \.self) { i in
                Text(braile[i == count/8 ? count % 8 : 8]).scaledFont(name: "Georgia", size: 24).frame(width: 12)
            }
            Text("\(roll)").scaledFont(name: "Georgia", size: 24)
        }.frame(width: 26, alignment: .center)

    }
}
struct FrequencyCount_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyCount(roll:10, count:15)
    }
}
