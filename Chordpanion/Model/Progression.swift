//
//  Progression.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/22/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

enum ScaleDegree {
    // major
    case I
    case II
    case III
    case IV
    case V
    case VI
    case VII
    
    // minor
    case i
    case ii
    case iii
    case iv
    case v
    case vi
    case vii
}

struct Progression {
    var key: Scale
    private var chords: [Chord]
    
    init?(inKey key: Scale, degrees: [ScaleDegree]) {
        
        self.key = key
        self.chords = []
        
        for degree in degrees {
            if let chord = Chord(inKey: key, offDegree: degree) {
                self.chords.append(chord)
            } else {
                return nil
            }
        }
    }
    
    init?(inKey key: Scale, qualitiesAndDegrees qnd: [(ChordClassification, ScaleDegree)]) {
        self.key = key
        self.chords = []
        
        for (quality, degree) in qnd {
            if let chord = Chord(inKey: key, offDegree: degree, quality: quality) {
                self.chords.append(chord)
            } else {
                return nil
            }
        }
    }
    
    init(fromKey key: Scale, withChords chords: [Chord]) {
        self.key = key
        self.chords = chords
    }
    
    mutating func borrow(fromKey key: Scale, degree: ScaleDegree, quality: ChordClassification, replacingChordAt index: Int) {
        guard index < self.chords.count else {
            print("ERROR: selected index greater than number of chords in progression")
            fatalError("Selected index greater than number of chords in progression")
        }
        guard let chord = Chord(inKey: key, offDegree: degree, quality: quality) else { print("ERROR: invalid chord"); fatalError("Invalid chord") }
        self.chords[index] = chord
    }
    
    mutating func append(chord: Chord) {
        self.chords.append(chord)
    }
    
    mutating func append(chords: [Chord]) {
        for chord in chords {
            self.chords.append(chord)
        }
    }
}

extension Progression: CustomStringConvertible {
    var description: String {
        return self.chords.enumerated().map { String("Chord \($0 + 1): \($1)") }.joined(separator: "\n")
    }
}
