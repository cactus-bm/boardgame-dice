//
//  GameStateModel.swift
//  boardgame dice
//
//  Created by James Robinson on 02/11/2020.
//  Copyright © 2020 James Robinson. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

class GameStateModel: ObservableObject {
    @ObservedObject var turnTracker: TurnTrackerStateModel
    @ObservedObject var frequencyCounter: FrequencyCounterStateModel
    @ObservedObject var rollTracker: RollTrackerStateModel
    @Published var settingsMode: Bool = false
    @Published var rollValue: String = ""
    @Published var doubleText: String = ""
    @Published var shuffleAfter: Int = 31
    @Published var isTurn: Bool = false
    @Published var rollAction: String = "Next"
    @Published var showPreferences = false
    @Published var audioOn = false
    @Published var namesOn = false
    let synthesizer = AVSpeechSynthesizer()
    
    init() {
        self.turnTracker = TurnTrackerStateModel(players: PlayersStateModel())
        self.rollTracker = RollTrackerStateModel()
        self.frequencyCounter = FrequencyCounterStateModel()
    }
    
    func deriveRollValue() -> String {
        if turnTracker.isTurn() {
            return "\(rollTracker.roll(turn: turnTracker.turnIndex()))"
        }
        else {
            return ""
        }
    }
    
    func deriveDoubleText() -> String {
        if turnTracker.isTurn() {
            return rollTracker.isDouble(turn: turnTracker.turnIndex()) ? "Double" : ""
        }
        else {
            return ""
        }
    }
    
    func roll() {
        turnTracker.increment()
        if turnTracker.turnIndex() % shuffleAfter == 0 {
            frequencyCounter.reset()
            rollTracker.shuffle()
        }
        doubleText = deriveDoubleText()
        rollValue = deriveRollValue()
        if turnTracker.isTurn() {
            self.frequencyCounter.increment(roll: rollTracker.roll(turn: turnTracker.turnIndex()))
        }
        isTurn = turnTracker.isTurn()
        rollAction = turnTracker.nextIsTurn() ? "Roll" : "Next"
        if audioOn && rollValue.count > 0 {
            let name = turnTracker.current().name
            let speech = namesOn && name.count > 0 ? "\(name) has rolled a \(rollValue)" : rollValue
            let utterance = AVSpeechUtterance(string: speech)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            synthesizer.speak(utterance)
        }
    }
    
    func reset() {
        turnTracker.reset()
        rollTracker.shuffle()
        frequencyCounter.reset()
        doubleText = ""
        rollValue = ""
        rollAction = "Next"
        isTurn = false
    }
}
