//
//  Chord.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

enum ChordClassification {
    // basic major and minor interval chords
    case major
    case minor
    case fifth
    case sixth
    case minorSixth
    case sixAddNine
    case dominantSeventh
    case minorSeventh
    case majorSeventh
    case union
    case dominantNinth
    case minorNinth
    case majorNinth
    case eleventh
    case thirteenth
    
    // add chords
    case addNine
    case addTwo
    
    // sustain chords
    case susTwo
    case susFour
    case sustained
    case sevenSusFour
    case nineSusFour
    
    // diminished chords
    case diminished
    case diminishedSeventh
    case minorSeventhFlatFive
    case halfDiminished
    
    // augmented chords
    case augmented
    case augmentedSeventh
    case sevenPlusFive      // equiv. to aug7
    case sevenSharpFive     // equiv. to aug7
    
    // altered chords
    case sevenMinusFive     // equiv. to 7b5
    case sevenFlatFive
    case sevenMinusNine     // equiv. to 7b9
    case sevenFlatNine
    case sevenPlusNine      // equiv. to 7#9
    case sevenSharpNine
}

struct Chord: CustomStringConvertible, Equatable {
    var notes: [Note]
    var classification: ChordClassification
    var name: String
    var bassNote: Note?
    
    init(in key: Note, ofType chord: ChordClassification) {
        notes = []
        classification = chord
        switch chord {
        case .major:
            name = key.name.uppercased()
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .minor:
            name = "\(key.name.uppercased())m"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .fifth:
            name = "\(key.name.uppercased())5"
            var note = key
            notes.append(note)
            note = note.augmentedSecond().augmentedSecond().halfStep()
            notes.append(note)
        case .sixth:
            name = "\(key.name.uppercased())6"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .minorSixth:
            name = "\(key.name.uppercased())m6"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .sixAddNine:
            name = "\(key.name.uppercased())6/9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond().wholeStep()
            notes.append(note)
        case .dominantSeventh:
            name = "\(key.name.uppercased())7"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .minorSeventh:
            name = "\(key.name.uppercased())m7"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .majorSeventh:
            name = "\(key.name.uppercased())maj7"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .union:
            name = "\(key.name.uppercased())u"
            notes.append(key)
            notes.append(key)
        case .dominantNinth:
            name = "\(key.name.uppercased())9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .minorNinth:
            name = "\(key.name.uppercased())m9"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .majorNinth:
            name = "\(key.name.uppercased())maj9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .eleventh:
            name = "\(key.name.uppercased())11"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .thirteenth:
            name = "\(key.name.uppercased())13"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .addTwo:
            name = "\(key.name.uppercased())add2"
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .addNine:
            name = "\(key.name.uppercased())add9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = key.wholeStep()
            notes.append(note)
        case .susTwo:
            name = "\(key.name.uppercased())sus2"
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond().wholeStep()
            notes.append(note)
        case .susFour:
            name = "\(key.name.uppercased())sus4"
            var note = key
            notes.append(note)
            note = note.augmentedSecond().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .sustained:
            name = "\(key.name.uppercased())sus"
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .sevenSusFour:
            name = "\(key.name.uppercased())7sus4"
            var note = key
            notes.append(note)
            note = note.augmentedSecond().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .nineSusFour:
            name = "\(key.name.uppercased())9sus4"
            var note = key
            notes.append(note)
            note = note.augmentedSecond().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .diminished:
            name = "\(key.name.uppercased())dim"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .diminishedSeventh:
            name = "\(key.name.uppercased())dim7"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .minorSeventhFlatFive:
            name = "\(key.name.uppercased())m7b5"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .halfDiminished:
            name = "\(key.name.uppercased())∅"
            var note = key
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .augmented:
            name = "\(key.name.uppercased())aug"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .augmentedSeventh:
            name = "\(key.name.uppercased())aug7"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .sevenSharpFive:
            name = "\(key.name.uppercased())7#5"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .sevenPlusFive:
            name = "\(key.name.uppercased())7+5"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .sevenFlatFive:
            name = "\(key.name.uppercased())7b5"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .sevenMinusFive:
            name = "\(key.name.uppercased())7-5"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
        case .sevenFlatNine:
            name = "\(key.name.uppercased())7b9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .sevenMinusNine:
            name = "\(key.name.uppercased())7-9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
        case .sevenSharpNine:
            name = "\(key.name.uppercased())7#9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond().wholeStep()
            notes.append(note)
        case .sevenPlusNine:
            name = "\(key.name.uppercased())7+9"
            var note = key
            notes.append(note)
            note = note.wholeStep().wholeStep()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond()
            notes.append(note)
            note = note.augmentedSecond().wholeStep()
            notes.append(note)
        }
    }
    
    /*
    init?(in key: Note, ofType scale: ScaleClassification, withStructure notes: String) {
        self.notes = []
        var modifier: String = ""
        for char in notes {
            switch char {
            case "#":
                modifier = "#"
            case "b":
                modifier = "b"
            case "/":
                modifier = "/"
            default:
                guard var index = Int(String(char)) else { return nil }
                if modifier == "/" {
                    index = index % 12
                    let baseScale = Scale(in: key, ofType: scale)
                    bassNote = baseScale.note(at: index - 1)!
                    return
                } else {
                    index = index % 12
                    let baseScale = Scale(in: key, ofType: scale)
                    var note = baseScale.note(at: index - 1)!
                    
                    if modifier == "#" {
                        note.sharp()
                    } else if modifier == "b" {
                        note.flat()
                    }
                    
                    self.notes.append(note)
                    modifier = ""
                }
            }
        }
    }
    */
    
    func alter(with: String) {
        
    }
    
    // first boolean: useSharps?
    // true if major key of C, G, D, A, E, B, F#, C#
    // false if major key of F, Bb, Eb, Ab, Db, Gb, Cb
    
    // second boolean: flatSeventh?
    func checkCircleOfFifths() -> (Bool, Bool) {
        var key = self.notes[0]
        var flatSeventh = false
        
        if self.classification == .minor || self.classification == .minorSixth || self.classification == .minorSeventh || self.classification == .minorNinth || self.classification == .dominantSeventh || self.classification == .dominantNinth || self.classification == .eleventh || self.classification == .thirteenth || self.classification == .sevenSusFour || self.classification == .nineSusFour || self.classification == .diminished || self.classification == .diminishedSeventh || self.classification == .halfDiminished || self.classification == .minorSeventhFlatFive || self.classification == .sevenFlatFive || self.classification == .sevenMinusFive || self.classification == .sevenFlatNine || self.classification == .sevenMinusNine || self.classification == .sevenPlusNine || self.classification == .sevenSharpNine || self.classification == .sevenPlusFive || self.classification == .sevenSharpFive {
            key = key.augmentedSecond()
        }
        
        /*
        if self.classification == .augmented || self.classification == .augmentedSeventh || self.classification == .sevenPlusFive || self.classification == .sevenSharpFive {
            flatSeventh = true
        }
        */
        
        if key.name == "C" || key.name == "G" || key.name == "D" || key.name == "A" || key.name == "E" || key.name == "B" || key.name == "F#" || key.name == "C#" {
            return (true, flatSeventh)
        } else {
            return (false, flatSeventh)
        }
    }
    
    var description: String {
        let (useSharps, flatSeven): (Bool, Bool) = checkCircleOfFifths()
        
        // TODO: need to determine 7th step of scale and use flat instead of sharp for aug, aug7, 7+5, and 7#5 (currently halfway implemented)
        
        
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
    
    static func == (lhs: Chord, rhs: Chord) -> Bool {
        return lhs.notes.isSame(as: rhs.notes)
    }
}

extension Array where Element: Comparable {
    func isSame(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
