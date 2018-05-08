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
    
    var description: String {
        let chordNames = chords.map { $0.name }
        return chordNames.joined(separator: "-")
    }
}
