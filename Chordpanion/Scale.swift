//
//  Scale.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

enum ScaleClassification {
    case major
    case minor_natural
    case minor_harmonic
    case minor_melodic
    
    case pentatonic_1
    case pentatonic_2
    case octatonic_1
    case octatonic_2
    
    case mode_ionian
    case mode_dorian
    case mode_phrygian
    case mode_lydian
    case mode_mixolydian
    case mode_aeolian
    case mode_locrian
    
    case chromatic
    
    case unclassified
}

struct Scale: CustomStringConvertible {
    
    var notes: [Note]
    var classification: ScaleClassification
    
    init(in key: Note, ofType scale: ScaleClassification) {
        notes = []
        switch scale {
        case .major, .mode_ionian:
            classification = scale
            // whole-whole-half-whole-whole-whole-half
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .minor_natural, .mode_aeolian:
            classification = scale
            // whole-half-whole-whole-half-whole-whole
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        default:
            classification = .unclassified
            break
        }
    }
    
    mutating func repeatTonic() {
        if notes[0] == notes[notes.count - 1] {
            return
        }
        notes.append(notes[0])
    }
    
    mutating func doNotRepeatTonic() {
        if notes[0] == notes[notes.count - 1] {
            notes.removeLast()
        }
    }
    
    var description: String {
        
        // TODO: need to differentiate between #'s and b's based on circle of fifths
        
        var toPrint: String = ""
        for note in notes {
            switch note.value {
            case 0:
                toPrint += "C "
            case 1:
                toPrint += "C# "
            case 2:
                toPrint += "D "
            case 3:
                toPrint += "D# "
            case 4:
                toPrint += "E "
            case 5:
                toPrint += "F "
            case 6:
                toPrint += "F# "
            case 7:
                toPrint += "G "
            case 8:
                toPrint += "G# "
            case 9:
                toPrint += "A "
            case 10:
                toPrint += "A# "
            case 11:
                toPrint += "B "
            default:
                toPrint = "Error"
            }
        }
        return toPrint
    }
}
