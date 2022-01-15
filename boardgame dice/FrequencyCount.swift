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
    
    func dots(_ row: Int) -> Int {
        if row < count / 8 {
            return 8
        }
        if row > count / 8 {
            return 0
        }
        return count % 8
    }
    
    var body: some View {
        let braile = roll > 7 ? LEFT_BRAILLE : RIGHT_BRAILLE
        VStack(alignment: .center) {
            ForEach((0...max(1,count/8)).reversed(), id: \.self) { row in
                Text(braile[dots(row)]).scaledFont(name: "Georgia", size: 24).frame(width: 12)
            }
            Text("\(roll)").scaledFont(name: "Georgia", size: 24)
        }.frame(minWidth: 32, alignment: .center)

    }
}
struct FrequencyCount_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyCount(roll:10, count:15)
    }
}
