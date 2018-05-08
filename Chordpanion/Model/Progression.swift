//
//  Progression.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/22/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import Foundation

enum ScaleDegree {
    case I
    case II
    case III
    case IV
    case V
    case VI
    case VII
    case i
    case ii
    case iii
    case iv
    case v
    case vi
    case vii
}

struct Progression: CustomStringConvertible {
    var key: Scale
    var chords: [Chord]
    
    init(in key: Scale) {
        self.key = key
        chords = []
    }
    
    init(in key: Scale, withChords chords: [Chord]) {
        self.key = key
        self.chords = chords
    }
    
    init?(in key: Scale, withDegrees degrees: [ScaleDegree]) {
        self.key = key
        chords = []
        for degree in degrees {
            switch degree {
            case .I:
                let scaleDegree = key.note(at: 0)!
                let chord = Chord(in: scaleDegree, ofType: .major)
                chords.append(chord)
            case .II:
                let scaleDegree = key.note(at: 1)!
                let chord = Chord(in: scaleDegree, ofType: .major)
                chords.append(chord)
            case .III:
                let scaleDegree = key.note(at: 2)!
                let chord = Chord(in: scaleDegree, ofType: .major)
                chords.append(chord)
            case .IV:
                let scaleDegree = key.note(at: 3)!
                let chord = Chord(in: scaleDegree, ofType: .major)
                chords.append(chord)
            case .V:
                let scaleDegree = key.note(at: 4)!
                let chord = Chord(in: scaleDegree, ofType: .major)
                chords.append(chord)
            case .VI:
                let scaleDegree = key.note(at: 5)!
                let chord = Chord(in: scaleDegree, ofType: .major)
                chords.append(chord)
            case .VII:
                let scaleDegree = key.note(at: 6)!
                let chord = Chord(in: scaleDegree, ofType: .major)
                chords.append(chord)
            case .i:
                let scaleDegree = key.note(at: 0)!
                let chord = Chord(in: scaleDegree, ofType: .minor)
                chords.append(chord)
            case .ii:
                let scaleDegree = key.note(at: 1)!
                let chord = Chord(in: scaleDegree, ofType: .minor)
                chords.append(chord)
            case .iii:
                let scaleDegree = key.note(at: 2)!
                let chord = Chord(in: scaleDegree, ofType: .minor)
                chords.append(chord)
            case .iv:
                let scaleDegree = key.note(at: 3)!
                let chord = Chord(in: scaleDegree, ofType: .minor)
                chords.append(chord)
            case .v:
                let scaleDegree = key.note(at: 4)!
                let chord = Chord(in: scaleDegree, ofType: .minor)
                chords.append(chord)
            case .vi:
                let scaleDegree = key.note(at: 5)!
                let chord = Chord(in: scaleDegree, ofType: .minor)
                chords.append(chord)
            case .vii:
                let scaleDegree = key.note(at: 6)!
                let chord = Chord(in: scaleDegree, ofType: .minor)
                chords.append(chord)
            }
        }
    }
    
    // TODO: finish this initializer (is it actually needed?)
    /*
    init?(in key: Scale, withIntervals intervals: [Interval]) {
        self.key = key
        chords = []
        for interval in intervals {
            switch interval {
            case .m2:
                let scaleDegree = key.note(at: 1)!
                let minorSecond = Chord(in: scaleDegree, ofType: .minor)
                chords.append(minorSecond)
            case .M2:
                let scaleDegree = key.note(at: 2)!
                let majorSecond = Chord(in: scaleDegree, ofType: .major)
            case .m3:
            case .M3:
            case .P4:
            case .P5:
            case .TT:
            case .m6:
            case .M6:
            case .m7:
            case .M7:
            }
        }
    }
    */
    
    var description: String {
        let chordNames = chords.map { $0.name }
        return chordNames.joined(separator: "-")
    }
}
