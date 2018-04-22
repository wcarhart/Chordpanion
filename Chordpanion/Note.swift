//
//  Note.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

enum Notes: Int {
    case C = 0
    case D = 2
    case E = 4
    case F = 5
    case G = 7
    case A = 9
    case B = 11
}

struct Note: Equatable, Comparable {
    
    var value: Int {
        didSet {
            value = value % 12
            print("WARNING: note value didSet()")
        }
    }
    var accidentalModifier: Int
    
    var name: String {
        switch value {
        case 0:
            return "C"
        case 1:
            return "C#"
        case 2:
            return "D"
        case 3:
            return "D#"
        case 4:
            return "E"
        case 5:
            return "F"
        case 6:
            return "F#"
        case 7:
            return "G"
        case 8:
            return "G#"
        case 9:
            return "A"
        case 10:
            return "A#"
        case 11:
            return "B"
        default:
            return ""
        }
    }
    
    init(value: Int) {
        self.value = value
        accidentalModifier = 0
    }
    
    init?(name: String) {
        switch name {
        case "Cbb", "cbb":
            value = 10
            accidentalModifier = -2
        case "Cb", "cb":
            value = 11
            accidentalModifier = -1
        case "C", "c":
            value = 0
            accidentalModifier = 0
        case "C#", "c#":
            value = 1
            accidentalModifier = 1
        case "C##", "c##":
            value = 2
            accidentalModifier = 2
        case "Dbb", "dbb":
            value = 0
            accidentalModifier = -2
        case "Db", "db":
            value = 1
            accidentalModifier = -1
        case "D", "d":
            value = 2
            accidentalModifier = 0
        case "D#", "d#":
            value = 3
            accidentalModifier = 1
        case "D##", "d##":
            value = 4
            accidentalModifier = 2
        case "Ebb", "ebb":
            value = 2
            accidentalModifier = -2
        case "Eb", "eb":
            value = 3
            accidentalModifier = -1
        case "E", "e":
            value = 4
            accidentalModifier = 0
        case "E#", "e#":
            value = 5
            accidentalModifier = 1
        case "E##", "e##":
            value = 6
            accidentalModifier = 2
        case "Fbb", "fbb":
            value = 3
            accidentalModifier = -2
        case "Fb", "fb":
            value = 4
            accidentalModifier = -1
        case "F", "f":
            value = 5
            accidentalModifier = 0
        case "F#", "f#":
            value = 6
            accidentalModifier = 1
        case "F##", "f##":
            value = 7
            accidentalModifier = 2
        case "Gbb", "gbb":
            value = 5
            accidentalModifier = -2
        case "Gb", "gb":
            value = 6
            accidentalModifier = -1
        case "G", "g":
            value = 7
            accidentalModifier = 0
        case "G#", "g#":
            value = 8
            accidentalModifier = 1
        case "G##", "g##":
            value = 9
            accidentalModifier = 2
        case "Abb", "abb":
            value = 7
            accidentalModifier = -2
        case "Ab", "ab":
            value = 8
            accidentalModifier = -1
        case "A", "a":
            value = 9
            accidentalModifier = 0
        case "A#", "a#":
            value = 10
            accidentalModifier = 1
        case "A##", "a##":
            value = 11
            accidentalModifier = 2
        case "Bbb", "bbb":
            value = 9
            accidentalModifier = -2
        case "Bb", "bb":
            value = 10
            accidentalModifier = -1
        case "B", "b":
            value = 11
            accidentalModifier = 0
        case "B#", "b#":
            value = 0
            accidentalModifier = 1
        case "B##", "b##":
            value = 1
            accidentalModifier = 2
        default:
            return nil
        }
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool{
       return lhs.value == rhs.value
    }
    
    static func < (lhs: Note, rhs: Note) -> Bool {
        return lhs.value < rhs.value
    }
    
    // MARK: accidentals functions
    
    mutating func doubleFlat() {
        value -= 2
        accidentalModifier -= 2
    }
    
    mutating func flat() {
        value -= 1
        accidentalModifier -= 1
    }
    
    mutating func natural() {
        value += (-1 * accidentalModifier)
        accidentalModifier = 0
    }
    
    mutating func sharp() {
        value += 1
        accidentalModifier += 1
    }
    
    mutating func doubleSharp() {
        value += 2
        accidentalModifier += 2
    }
    
    // MARK: stepwise functions
    
    func halfStep() -> Note {
        return Note(value: (self.value + 1) % 12)
    }
    
    func wholeStep() -> Note {
        return Note(value: (self.value + 2) % 12)
    }
    
    func augmentedSecond() -> Note {
        return Note(value: (self.value + 3) % 12)
    }
}
