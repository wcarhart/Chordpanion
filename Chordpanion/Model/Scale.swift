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

enum Interval: Int {
    case P1 = 0
    case m2 = 1
    case M2 = 2
    case m3 = 3
    case M3 = 4
    case P4 = 5
    case TT = 6
    case P5 = 7
    case m6 = 8
    case M6 = 9
    case m7 = 10
    case M7 = 11
    case P8 = 12
    case m9 = 13
    case M9 = 14
    case m10 = 15
    case M10 = 16
    case P11 = 17
    case TT2 = 18
    case P12 = 19
    case m13 = 20
    case M13 = 21
    case m14 = 22
    case M14 = 23
    case P15 = 24
}

enum Step {
    case whole
    case half
    case augmentedSecond
}

struct Scale {
    
    private var notes: [Note]
    var classification: ScaleClassification
    private var name: String?
    
    init(inKeyNamed key: String, ofType scale: ScaleClassification) {
        
        let note: Note
        var name: String
        
        switch key.lowercased() {
        case "c":
            note = Note(value: 0)
            name = "C"
        case "c#":
            note = Note(value: 1)
            name = "C#"
        case "db":
            note = Note(value: 1)
            name = "Db"
        case "d":
            note = Note(value: 2)
            name = "D"
        case "d#":
            note = Note(value: 3)
            name = "D#"
        case "eb":
            note = Note(value: 3)
            name = "Eb"
        case "e":
            note = Note(value: 4)
            name = "E"
        case "f":
            note = Note(value: 5)
            name = "F"
        case "f#":
            note = Note(value: 6)
            name = "F#"
        case "gb":
            note = Note(value: 6)
            name = "Gb"
        case "g":
            note = Note(value: 7)
            name = "G"
        case "g#":
            note = Note(value: 8)
            name = "G#"
        case "ab":
            note = Note(value: 8)
            name = "Ab"
        case "a":
            note = Note(value: 9)
            name = "A"
        case "a#":
            note = Note(value: 10)
            name = "A#"
        case "bb":
            note = Note(value: 10)
            name = "Bb"
        case "b":
            note = Note(value: 11)
            name = "B"
        case "cb":
            note = Note(value: 11)
            name = "Cb"
        default:
            print("ERROR: invalid note name for key")
            fatalError("invalid note name for key")
        }
        
        self = Scale(in: note, ofType: scale)
        self.name = name
    }
    
    init(in key: Note, ofType scale: ScaleClassification) {
        self.notes = []
        self.classification = scale
        switch scale {
        case .major, .mode_ionian:
            // from major - built off scale degree 1
            buildScale(ofOff: key, withSteps: [.whole, .whole, .half, .whole, .whole, .whole, .half])
            
        case .minor_natural, .mode_aeolian:
            // from major - built off scale degree 6
            buildScale(ofOff: key, withSteps: [.whole, .half, .whole, .whole, .half, .whole, .whole])
            
        case .minor_harmonic:
            buildScale(ofOff: key, withSteps: [.whole, .half, .whole, .whole, .half, .augmentedSecond, .half])
            
        case .minor_melodic:
            buildScale(ofOff: key, withSteps: [.whole, .half, .whole, .whole, .whole, .whole, .half])

        case .pentatonic_1_major:
            // off major scale - 1-2-3-5-6
            buildScale(ofOff: key, withIntervals: [.M2, .M3, .P5, .M6])
            
        case .pentatonic_2_major:
            // off major - 1-2-4-5-6
            buildScale(ofOff: key, withIntervals: [.M2, .P4, .P5, .M6])
            
        case .pentatonic_1_minor:
            // off minor - 1-2-3-5-6
            buildScale(ofOff: key, withIntervals: [.M2, .m3, .P5, .m6])
            
        case .pentatonic_2_minor:
            // off minor - 1-2-4-5-6
            buildScale(ofOff: key, withIntervals: [.M2, .P4, .P5, .m6])
            
        case .octatonic_1:
            buildScale(ofOff: key, withSteps: [.whole, .half, .whole, .half, .whole, .half, .whole, .half])
            
        case .octatonic_2:
            buildScale(ofOff: key, withSteps: [.half, .whole, .half, .whole, .half, .whole, .half, .whole])
            
        case .blues:
            // from major - 1-b3-4-b5-5-b7
            buildScale(ofOff: key, withIntervals: [.m3, .P4, .TT, .P5, .m7])
            
        case .bebop:
            // major with a b7
            buildScale(ofOff: key, withSteps: [.whole, .whole, .half, .whole, .whole, .half, .half, .half])
            
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
            buildScale(ofOff: key, withSteps: [.whole, .half, .whole, .whole, .whole, .half])
            
        case .mode_phrygian:
            // from major - built off scale degree 3
            buildScale(ofOff: key, withSteps: [.half, .whole, .whole, .whole, .half, .whole])
            
        case .mode_lydian:
            // from major - built off scale degree 4
            buildScale(ofOff: key, withSteps: [.whole, .whole, .whole, .half, .whole, .whole])
            
        case .mode_mixolydian:
            // from major - built off scale degree 5
            buildScale(ofOff: key, withSteps: [.whole, .whole, .half, .whole, .whole, .half])
            
        case .mode_locrian:
            // from major - built off scale degree 7
            buildScale(ofOff: key, withSteps: [.half, .whole, .whole, .half, .whole, .whole])
            
        case .unclassified:
            classification = .unclassified
            break
        }
    }
    
    private mutating func buildScale(ofOff key: Note, withIntervals intervals: [Interval]) {
        
        self.notes.append(key)
        
        for interval in intervals {
            switch interval {
            case .P1, .P8, .P15:
                self.notes.append(key)
            case .m2, .m9:
                self.notes.append(key.cloneNote(withHalfSteps: 1))
            case .M2, .M9:
                self.notes.append(key.cloneNote(withHalfSteps: 2))
            case .m3, .m10:
                self.notes.append(key.cloneNote(withHalfSteps: 3))
            case .M3, .M10:
                self.notes.append(key.cloneNote(withHalfSteps: 4))
            case .P4, .P11:
                self.notes.append(key.cloneNote(withHalfSteps: 5))
            case .TT, .TT2:
                self.notes.append(key.cloneNote(withHalfSteps: 6))
            case .P5, .P12:
                self.notes.append(key.cloneNote(withHalfSteps: 7))
            case .m6, .m13:
                self.notes.append(key.cloneNote(withHalfSteps: 8))
            case .M6, .M13:
                self.notes.append(key.cloneNote(withHalfSteps: 9))
            case .m7, .m14:
                self.notes.append(key.cloneNote(withHalfSteps: 10))
            case .M7, .M14:
                self.notes.append(key.cloneNote(withHalfSteps: 11))
            }
        }
    }
    
    private mutating func buildScale(ofOff key: Note, withSteps steps: [Step]) {
        
        var note = key
        self.notes.append(note)
        
        for step in steps {
            switch step {
            case.half:
                note = note.halfStep()
                self.notes.append(note)
            case .whole:
                note = note.wholeStep()
                self.notes.append(note)
            case .augmentedSecond:
                note = note.augmentedSecond()
                self.notes.append(note)
            }
        }
    }
    
    func invert() -> Scale {
        switch self.classification {
        case .major, .mode_ionian:
            return Scale(in: self.notes[0], ofType: .minor_natural)
        case .minor_natural, .mode_aeolian, .minor_melodic, .minor_harmonic:
            return Scale(in: self.notes[0], ofType: .major)
        case .pentatonic_1_major:
            return Scale(in: self.notes[0], ofType: .pentatonic_1_minor)
        case .pentatonic_2_major:
            return Scale(in: self.notes[0], ofType: .pentatonic_2_minor)
        case .pentatonic_1_minor:
            return Scale(in: self.notes[0], ofType: .pentatonic_1_major)
        case .pentatonic_2_minor:
            return Scale(in: self.notes[0], ofType: .pentatonic_2_major)
        default:
            print("ERROR: could not invert scale - please make sure scale can be inverted (only available for major and minor scales")
            fatalError()
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
    
    mutating func setName(to name: String) {
        self.name = name
    }
    
}

extension Scale: CustomStringConvertible {
    
    func resolveKeyMapping() -> [Int: String] {
        var nameToUse: String
        var toReturn = [Int: String]()

        if let name = self.name {
            nameToUse = name
        } else {
            nameToUse = resolveName()
        }
        
        if self.classification == .minor_harmonic || self.classification == .minor_natural || self.classification == .minor_melodic || self.classification == .mode_aeolian {
            switch nameToUse.lowercased() {
            case "a":
                nameToUse = "C"
            case "e":
                nameToUse = "G"
            case "b":
                nameToUse = "D"
            case "f#":
                nameToUse = "A"
            case "c#":
                nameToUse = "E"
            case "g#":
                nameToUse = "B"
            case "ab":
                nameToUse = "Cb"
            case "d#":
                nameToUse = "F#"
            case "eb":
                nameToUse = "Gb"
            case "a#":
                nameToUse = "C#"
            case "bb":
                nameToUse = "Db"
            case "f":
                nameToUse = "Ab"
            case "c":
                nameToUse = "Eb"
            case "g":
                nameToUse = "Bb"
            case "d":
                nameToUse = "F"
            default:
                break
            }
        }

        switch nameToUse.lowercased() {
        case "c":
            toReturn = [0: "C", 2: "D", 4: "E", 5: "F", 7: "G", 9: "A", 11: "B"]
        case "c#":
            toReturn = [1: "C#", 3: "D#", 5: "E#", 6: "F#", 8: "G#", 10: "A#", 0: "B#"]
        case "db":
            toReturn = [1: "Db", 3: "Eb", 5: "F", 6: "Gb", 8: "Ab", 10: "Bb", 0: "C"]
        case "d":
            toReturn = [2: "D", 4: "E", 6: "F#", 7: "G", 9: "A", 11: "B", 1: "C"]
        case "d#":
            // TODO: minor key, how to handle this?
            break
        case "eb":
            toReturn = [3: "Eb", 5: "F", 7: "G", 8: "Ab", 10: "Bb", 0: "C", 2: "D"]
        case "e":
            toReturn = [4: "E", 6: "F#", 8: "G", 9: "A", 11: "B", 1: "C#", 3: "D#"]
        case "f":
            toReturn = [5: "F", 7: "G", 9: "A", 10: "Bb", 0: "C", 2: "D", 4: "E"]
        case "f#":
            toReturn = [6: "F#", 8: "G#", 10: "A#", 11: "B", 1: "C#", 3: "D#", 5: "E#"]
        case "gb":
            toReturn = [6: "Gb", 8: "Ab", 10: "Bb", 11: "Cb", 1: "Db", 3: "Eb", 5: "F"]
        case "g":
            toReturn = [7: "G", 9: "A", 11: "B", 0: "C", 2: "D", 4: "E", 6: "F#"]
        case "g#":
            // TODO: minor key, how to handle this?
            break
        case "ab":
            toReturn = [8: "Ab", 10: "Bb", 0: "C", 1: "Db", 3: "Eb", 5: "F", 7: "G"]
        case "a":
            toReturn = [9: "A", 11: "B", 1: "C#", 2: "D", 4: "E", 6: "F#", 8: "G#"]
        case "a#":
            // TODO: minor key, how to handle this?
            break
        case "bb":
            toReturn = [10: "Bb", 0: "C", 2: "D", 3: "Eb", 5: "F", 7: "G", 9: "A"]
        case "b":
            toReturn = [11: "B", 1: "C#", 3: "D#", 4: "E", 6: "F#", 8: "G#", 10: "A#"]
        case "cb":
            toReturn = [11: "Cb", 1: "Db", 3: "Eb", 4: "Fb", 6: "Gb", 8: "Ab", 10: "Bb"]
        default:
            break
        }
        
        return toReturn
    }
    
    func resolveName() -> String {
        
        switch self.notes[0].value {
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
            print("ERROR: could not determine note value")
            fatalError("Could not determine note value")
        }
    }
    
    
    var description: String {
        let keyMap = resolveKeyMapping()
        return self.notes.map { keyMap[$0.value]! }.joined(separator: "-")
    }
    
}
