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
    case bebop
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
        classification = scale
        switch scale {
        case .major, .mode_ionian:
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
        case .bebop:
            // whole-whole-half-whole-whole-half-half-half
            // major with a b7
            
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
            note = note.halfStep()
            notes.append(note)
        case .chromatic:
            // half-half-half-half-half-half-half-half-half-half-half-half
            
            var note = key
            for _ in 1...12 {
                notes.append(note)
                note = note.halfStep()
            }
        case .wholetone:
            // whole-whole-whole-whole-whole-whole
            
            var note = key
            for _ in 1...6 {
                notes.append(note)
                note = note.wholeStep()
            }
        case .mode_dorian:
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
    
    // true if major key of C, G, D, A, E, B, F#, C#
    // false if major key of F, Bb, Eb, Ab, Db, Gb, Cb
    func checkCircleOfFifths() -> Bool {
        var key = self.notes[0]
        
        if self.classification == .minor_harmonic || self.classification == .minor_melodic || self.classification == .minor_harmonic || self.classification == .mode_aeolian {
            key = key.augmentedSecond()
        }
        
        if key.name == "C" || key.name == "G" || key.name == "D" || key.name == "A" || key.name == "E" || key.name == "B" || key.name == "F#" || key.name == "C#" {
            return true
        } else {
            return false
        }
    }
    
    var description: String {
        let useSharps = checkCircleOfFifths()
        
        // TODO: make this more robust (account for bb, b, nat, #, ##)
        
        var toPrint: String = ""
        for note in notes {
            switch note.value {
            case 0:
                toPrint += "C "
            case 1:
                if useSharps {
                    toPrint += "C# "
                } else {
                    toPrint += "Db "
                }
            case 2:
                toPrint += "D "
            case 3:
                if useSharps {
                    toPrint += "D# "
                } else {
                    toPrint += "Eb "
                }
            case 4:
                toPrint += "E "
            case 5:
                toPrint += "F "
            case 6:
                if useSharps {
                    toPrint += "F# "
                } else {
                    toPrint += "Gb "
                }
            case 7:
                toPrint += "G "
            case 8:
                if useSharps {
                    toPrint += "G# "
                } else {
                    toPrint += "Ab "
                }
            case 9:
                toPrint += "A "
            case 10:
                if useSharps {
                    toPrint += "A# "
                } else {
                    toPrint += "Bb "
                }
            case 11:
                toPrint += "B "
            default:
                toPrint = "Error"
            }
        }
        return toPrint
    }
}
