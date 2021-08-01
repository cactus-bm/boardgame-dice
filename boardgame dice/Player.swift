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
    var id = UUID()
    var color: Color
    var isOn: Bool
    var name: String
    var sortOrder: Int
    
    
    init(color: Color, isOn: Bool, sortOrder: Int) {
        self.color = color
        self.isOn = isOn
        self.sortOrder = sortOrder
        self.name = ""
    }
}
