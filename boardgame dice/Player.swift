//
//  Player.swift
//  boardgame dice
//
//  Created by James Robinson on 25/12/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation
import SwiftUI


class Player: Identifiable, ObservableObject {
    let color: Color
    @Published var isOn: Bool
    
    init(color: Color, isOn: Bool) {
        self.color = color
        self.isOn = isOn
    }
}
