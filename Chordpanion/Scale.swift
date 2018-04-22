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
    
    case pentatonic_1_major
    case pentatonic_2_major
    case pentatonic_1_minor
    case pentatonic_2_minor
    case octatonic_1
    case octatonic_2
    
    case blues
    case chromatic
    case wholetone
    
    case mode_ionian
    case mode_dorian
    case mode_phrygian
    case mode_lydian
    case mode_mixolydian
    case mode_aeolian
    case mode_locrian
    
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
            // from major - built off scale degree 1
            
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
            // from major - built off scale degree 6
            
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
        case .minor_harmonic:
            classification = scale
            // whole-half-whole-whole-half-augmentedSecond-half
            
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
            note = note.augmentedSecond()
            notes.append(note)
        case .minor_melodic:
            classification = scale
            // whole-half-whole-whole-whole-whole-half
            
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
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .pentatonic_1_major:
            classification = scale
            // of major scale - 1-2-3-5-6
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .pentatonic_2_major:
            classification = scale
            // of major - 1-2-4-5-6
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .pentatonic_1_minor:
            classification = scale
            // of minor - 1-2-3-5-6
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
        case .pentatonic_2_minor:
            classification = scale
            // of minor - 1-2-4-5-6
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
        case .octatonic_1:
            classification = scale
            // whole-half-whole-half-whole-half-whole-half
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
        case .octatonic_2:
            classification = scale
            // half-whole-half-whole-half-whole-half-whole
            
            var note = key
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .blues:
            classification = scale
            // from major - 1-b3-4-b5-5-b7
            
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .chromatic:
            classification = scale
            // half-half-half-half-half-half-half-half-half-half-half-half
            
            var note = key
            for _ in 1...12 {
                notes.append(note)
                note = note.halfStep()
            }
        case .wholetone:
            classification = scale
            // whole-whole-whole-whole-whole-whole
            
            var note = key
            for _ in 1...6 {
                notes.append(note)
                note = note.wholeStep()
            }
        case .mode_dorian:
            classification = scale
            // from major - built off scale degree 2
            
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
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
        case .mode_phrygian:
            classification = scale
            // from major - built off scale degree 3
            
            var note = key
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .mode_lydian:
            classification = scale
            // from major - built off scale degree 4
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
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
        case .mode_mixolydian:
            classification = scale
            // from major - built off scale degree 5
            
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
            note = note.halfStep()
            notes.append(note)
        case .mode_locrian:
            classification = scale
            // from major - built off scale degree 7
            
            var note = key
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
            note = note.wholeStep()
            notes.append(note)
        case .unclassified:
            classification = .unclassified
            break
        }
    }
    
    func note(at index: Int) -> Note? {
        return index <= notes.count ? notes[index] : nil
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
