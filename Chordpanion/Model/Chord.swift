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
    
    case unknown
}

enum Inversion {
    case root
    case first
    case second
    case third
}

struct Chord {
    var notes: [Note]
    var baseScale: Scale
    var classification: ChordClassification
    
    private (set) var name: String
    
    init?(inKey key: Scale, offDegree degree: ScaleDegree) {
        
        var quality: ChordClassification
        
        switch degree {
        case .I, .II, .III, .IV, .V, .VI, .VII:
            guard key.classification == .major else {
                print("ERROR: major scale degree requires a major scale")
                return nil
            }
            quality = .major
        case .i, .ii, .iii, .iv, .v, .vi, .vii:
            guard key.classification != .minor_natural || key.classification != .minor_melodic || key.classification != .minor_harmonic else {
                print("ERROR: minor scale degree requires a minor scale")
                return nil
            }
            quality = .minor
        }
        
        guard let chord = Chord(inKey: key, offDegree: degree, quality: quality) else { return nil }
        self = chord
    }
    
    init?(inKey key: Scale, offDegree degree: ScaleDegree, quality: ChordClassification) {
        guard let chord = Chord(inKey: key, offDegree: degree, quality: quality, inversion: .root) else { return nil }
        self = chord
    }
    
    init?(inKey key: Scale, offDegree degree: ScaleDegree, quality: ChordClassification, inversion: Inversion) {
        
        // b/c of silly Swift compiler issues
        self.notes = []
        self.baseScale = key
        self.classification = quality
        self.name = ""
        
        // TODO: finish name detection
        self.name = "\(key.resolveName())\(abbreviate())"
        
        switch degree {
        case .I, .i:
            guard let startingNote = key.note(at: 0) else { print("ERROR: invalid scale degree"); return nil }
            buildChord(ofOff: startingNote, ofType: quality)
        case .II, .ii:
            guard let startingNote = key.note(at: 1) else { print("ERROR: invalid scale degree"); return nil }
            buildChord(ofOff: startingNote, ofType: quality)
        case .III, .iii:
            guard let startingNote = key.note(at: 2) else { print("ERROR: invalid scale degree"); return nil }
            buildChord(ofOff: startingNote, ofType: quality)
        case .IV, .iv:
            guard let startingNote = key.note(at: 3) else { print("ERROR: invalid scale degree"); return nil }
            buildChord(ofOff: startingNote, ofType: quality)
        case .V, .v:
            guard let startingNote = key.note(at: 4) else { print("ERROR: invalid scale degree"); return nil }
            buildChord(ofOff: startingNote, ofType: quality)
        case .VI, .vi:
            guard let startingNote = key.note(at: 5) else { print("ERROR: invalid scale degree"); return nil }
            buildChord(ofOff: startingNote, ofType: quality)
        case .VII, .vii:
            guard let startingNote = key.note(at: 6) else { print("ERROR: invalid scale degree"); return nil }
            buildChord(ofOff: startingNote, ofType: quality)
        }
        
        switch inversion {
        case .root:
            break
        case .first:
            self.notes.rotate(by: 1)
        case .second:
            self.notes.rotate(by: 2)
        case .third:
            self.notes.rotate(by: 3)
        }
        
    }
    
    private func abbreviate() -> String {
        switch self.classification {
        case .major:
            return ""
        case .minor:
            return "m"
        case .fifth:
            return "5"
        case .sixth:
            return "6"
        case .minorSixth:
            return "m6"
        case .sixAddNine:
            return "6/9"
        case .dominantSeventh:
            return "7"
        case .minorSeventh:
            return "m7"
        case .majorSeventh:
            return "maj7"
        case .union:
            return "U"
        case .dominantNinth:
            return "9"
        case .minorNinth:
            return "m9"
        case .majorNinth:
            return "maj9"
        case .eleventh:
            return "11"
        case .thirteenth:
            return "13"
        case .addNine:
            return "add9"
        case .addTwo:
            return "add2"
        case .susTwo:
            return "sus2"
        case .susFour:
            return "sus4"
        case .sustained:
            return "sus"
        case .sevenSusFour:
            return "7sus4"
        case .nineSusFour:
            return "9sus4"
        case .diminished:
            return "dim"
        case .diminishedSeventh:
            return "dim7"
        case .minorSeventhFlatFive, .halfDiminished:
            return "m7b5"
        case .augmented:
            return "aug"
        case .augmentedSeventh:
            return "aug7"
        case .sevenPlusFive:
            return "7+5"
        case .sevenSharpFive:
            return "7#5"
        case .sevenMinusFive:
            return "7-5"
        case .sevenFlatFive:
            return "7b7"
        case .sevenMinusNine:
            return "7-9"
        case .sevenFlatNine:
            return "7b9"
        case .sevenPlusNine:
            return "7+9"
        case .sevenSharpNine:
            return "7#9"
        case .unknown:
            return ""
        }
    }
    
    private mutating func buildChord(ofOff key: Note, ofType classification: ChordClassification) {
        
        let note = key
        self.notes.append(note)
        
        switch classification {
        // basic chords
        case .major:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
        case .minor:
            self.notes.append(key.interval(.m3))
            self.notes.append(key.interval(.P5))
        case .fifth:
            self.notes.append(key.interval(.P5))
        case .sixth:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.M6))
        case .minorSixth:
            self.notes.append(key.interval(.m3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.M6))
        case .sixAddNine:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.M6))
            self.notes.append(key.interval(.M9))
        case .dominantSeventh:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
        case .minorSeventh:
            self.notes.append(key.interval(.m3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
        case .majorSeventh:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.M7))
        case .union:
            self.notes.append(key.interval(.P8))
        case .dominantNinth:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
            self.notes.append(key.interval(.M9))
        case .minorNinth:
            self.notes.append(key.interval(.m3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
            self.notes.append(key.interval(.M9))
        case .majorNinth:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.M7))
            self.notes.append(key.interval(.M9))
        case .eleventh:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
            self.notes.append(key.interval(.M9))
            self.notes.append(key.interval(.P11))
        case .thirteenth:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
            self.notes.append(key.interval(.M9))
            self.notes.append(key.interval(.P11))
            self.notes.append(key.interval(.M13))
            
        // add chords
        case .addNine:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.M9))
        case .addTwo:
            self.notes.append(key.interval(.M2))
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
        case .susTwo:
            self.notes.append(key.interval(.M2))
            self.notes.append(key.interval(.P5))
        case .susFour:
            self.notes.append(key.interval(.P4))
            self.notes.append(key.interval(.P5))
        case .sustained:
            self.notes.append(key.interval(.M2))
            self.notes.append(key.interval(.P4))
            self.notes.append(key.interval(.P5))
        case .sevenSusFour:
            self.notes.append(key.interval(.P4))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
        case .nineSusFour:
            self.notes.append(key.interval(.P4))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
            self.notes.append(key.interval(.M9))
            
        // diminished chords
        case .diminished:
            self.notes.append(key.interval(.m3))
            self.notes.append(key.interval(.TT))
        case .diminishedSeventh:
            self.notes.append(key.interval(.m3))
            self.notes.append(key.interval(.TT))
            self.notes.append(key.interval(.M6))
        case .minorSeventhFlatFive, .halfDiminished:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.TT))
            self.notes.append(key.interval(.m7))
            
        // augmented
        case .augmented:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.m6))
        case .augmentedSeventh, .sevenPlusFive, .sevenSharpFive:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.m6))
            self.notes.append(key.interval(.m7))
        case .sevenMinusFive, .sevenFlatFive:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.TT))
            self.notes.append(key.interval(.m7))
        case .sevenMinusNine, .sevenFlatNine:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
            self.notes.append(key.interval(.m9))
        case .sevenPlusNine, .sevenSharpNine:
            self.notes.append(key.interval(.M3))
            self.notes.append(key.interval(.P5))
            self.notes.append(key.interval(.m7))
            self.notes.append(key.interval(.m10))
        case .unknown:
            print("ERROR: could not classify chord")
            fatalError("Could not classify chord")
        }
    }
    
}

extension Chord: Equatable, CustomStringConvertible {
    static func == (lhs: Chord, rhs: Chord) -> Bool {
        return lhs.notes == rhs.notes
    }
    
    func output() {
        
    }
    
    var description: String {
        let keyMap = self.baseScale.resolveKeyMapping()
        return "\(self.name): \(self.notes.map { keyMap[$0.value] ?? "" }.joined(separator: "-"))"
    }
}

extension Array {
    mutating func rotate(by positions: Int, size: Int? = nil) {
        guard positions < count && (size ?? 0) <= count else {
            print("invalid input1")
            return
        }
        reversed(start: 0, end: positions - 1)
        reversed(start: positions, end: (size ?? count) - 1)
        reversed(start: 0, end: (size ?? count) - 1)
    }
    
    mutating func reversed(start: Int, end: Int) {
        guard start >= 0 && end < count && start < end else {
            return
        }
        var start = start
        var end = end
        while start < end, start != end {
            self.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

