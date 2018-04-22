//
//  Note.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

struct Note: Equatable, Comparable{
    
    let value: Int
    
    static func == (lhs: Note, rhs: Note) -> Bool{
       return lhs.value == rhs.value
    }
    
    static func < (lhs: Note, rhs: Note) -> Bool {
        return lhs.value < rhs.value
    }
    
    // MARK: accidentals
    
    func doubleFlat() -> Note {
        return Note(value: self.value - 2)
    }
    
    func flat() -> Note {
        return Note(value: self.value - 1)
    }
    
    func natural() -> Note {
        return Note(value: self.value)
    }
    
    func sharp() -> Note {
        return Note(value: self.value + 1)
    }
    
    func doubleSharp() -> Note {
        return Note(value: self.value + 2)
    }
}
