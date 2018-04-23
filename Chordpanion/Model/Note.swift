//
//  Note.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

struct Note: Equatable, Comparable {
    
    var value: Int {
        didSet {
            value = value % 12
            // DEBUG:
            print("WARNING: note value didSet()")
        }
    }
    var accidentalModifier: Int
    
    var name: String {
        switch (value, accidentalModifier) {
        // C
        case (0, -2):
            return "Dbb"
        case (0, 0):
            return "C"
        case (0, 1):
            return "B#"

        // C#/Db
        case (1, -1):
            return "Db"
        // TODO: Determine if this should be C# or Db
        case (1, 0):
            return "Db"
        case (1, 1):
            return "C#"
        case (1, 2):
            return "B##"

        // D
        case (2, -2):
            return "Ebb"
        case (2, 0):
            return "D"
        case (2, 2):
            return "C##"
            
        // D#/Eb
        case (3, -2):
            return "Fbb"
        case (3, -1):
            return "Eb"
        // TODO: Determine if this should be D# or Eb
        case (3, 0):
            return "Eb"
        case (3, 1):
            return "D#"
            
        // E
        case (4, -1):
            return "Fb"
        case (4, 0):
            return "E"
        case (4, 2):
            return "D##"
            
        // F
        case (5, -2):
            return "Gbb"
        case (5, 0):
            return "F"
        case (5, 1):
            return "E#"
            
        // F#/Gb
        case (6, -1):
            return "Gb"
        // TODO: Determine if this should be F# or Gb
        case (6, 0):
            return "Gb"
        case (6, 1):
            return "F#"
        case (6, 2):
            return "E##"
            
        // G
        case (7, -2):
            return "Abb"
        case (7, 0):
            return "G"
        case (7, 2):
            return "F##"
            
        // G#/Ab
        case (8, -1):
            return "Ab"
        // TODO: Determine if this should be G# or Ab
        case (8, 0):
            return "Ab"
        case (8, 1):
            return "G#"
            
            
        // A
        case (9, -2):
            return "Bbb"
        case (9, 0):
            return "A"
        case (9, 2):
            return "G##"
            
        // A#/Bb
        case (10, -2):
            return "Cbb"
        case (10, -1):
            return "Bb"
        // TODO: Determine if this should be A# or Bb
        case (10, 0):
            return "Bb"
        case (10, 1):
            return "A#"
            
        // B
        case (11, -1):
            return "Cb"
        case (11, 0):
            return "B"
        case (11, 2):
            return "A##"
            
        default:
            print("Uh oh, found value = \(value) and modifier = \(accidentalModifier)")
            return "ERROR"
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
    
    // MARK: Equatable + Comparable functions
    
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
