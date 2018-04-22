//
//  Chord.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

enum ChordClassification {
    case major
    case minor
    case augmented
    case diminished
    case sustained
    case sustained2
    case sustained4
    case majorSeventh
    case minorSeventh
    case dominantSeventh
}

struct Chord {
    var notes: [Note]
    var classification: ChordClassification
    var name: String
    
    init(in key: Note, ofType chord: ChordClassification) {
        notes = []
        switch chord {
        case .major:
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            
            name = key.name.uppercased()
        case .minor:
        case .augmented:
        case .diminished:
        case .sustained:
        case .sustained2:
        case .sustained4:
        case .majorSeventh:
        case .minorSeventh:
        case .dominantSeventh:
        }
    }
}
