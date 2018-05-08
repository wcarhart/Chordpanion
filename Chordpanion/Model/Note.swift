//
//  Note.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

struct Note {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    init?(name: String) {
        let name = name.lowercased()
        switch name {
        case "b#", "c", "dbb":
            self.value = 0
        case "b##", "c#", "db":
            self.value = 1
        case "c##", "d", "ebb":
            self.value = 2
        case "d#", "eb", "fbb":
            self.value = 3
        case "d##", "e", "fb":
            self.value = 4
        case "e#", "f", "gbb":
            self.value = 5
        case "e##", "f#", "gb":
            self.value = 6
        case "f##", "g", "abb":
            self.value = 7
        case "g#", "ab":
            self.value = 8
        case "g##", "a", "bbb":
            self.value = 9
        case "a#", "bb", "cbb":
            self.value = 10
        case "a##", "b", "cb":
            self.value = 5
        default:
            return nil
        }
    }
    
    mutating func doubleFlat() {
        self.value -= 2
    }
    
    mutating func flat() {
        self.value -= 1
    }
    
    mutating func sharp() {
        self.value += 1
    }
    
    mutating func doubleSharp() {
        self.value += 2
    }
    
    func halfStep() -> Note {
        return Note(value: (self.value + 1) % 12)
    }

    func wholeStep() -> Note {
        return Note(value: (self.value + 2) % 12)
    }

    func augmentedSecond() -> Note {
        return Note(value: (self.value + 3) % 12)
    }
    
    func cloneNote(withHalfSteps value: Int) -> Note {
        return Note(value: (self.value + value) % 12)
    }
    
}

extension Note: Comparable, Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func < (lhs: Note, rhs: Note) -> Bool {
        return lhs.value < rhs.value
    }
}
