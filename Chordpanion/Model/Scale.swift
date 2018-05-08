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

enum Interval {
    case P1
    case m2
    case M2
    case m3
    case M3
    case P4
    case TT
    case P5
    case m6
    case M6
    case m7
    case M7
    case P8
    case m9
    case M9
    case m10
    case M10
    case P11
    case TT12
    case P13
    case m14
    case M14
    case m15
    case M15
    case P16
}

enum Step {
    case whole
    case half
    case augmentedSecond
}

struct Scale: CustomStringConvertible {
    
    var notes: [Note]
    var classification: ScaleClassification
    
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
            buildScale(ofOff: key, withStep: [.whole, .whole, .half, .whole, .whole, .half, .half, .half])
            
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
        }
    }
    
    
        case .mode_phrygian:
            // from major - built off scale degree 3
            
            var note = key
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .mode_lydian:
            // from major - built off scale degree 4
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .mode_mixolydian:
            // from major - built off scale degree 5
            
            var note = key
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
        case .mode_locrian:
            // from major - built off scale degree 7
            
            var note = key
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.halfStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
            note = note.wholeStep()
            notes.append(note)
        case .unclassified:
            classification = .unclassified
            break
        }
    }
    
    private mutating func buildScale(ofOff key: Note, withIntervals intervals: [Interval]) {
        
        self.notes.append(key)
        
        for interval in intervals {
            switch interval {
            case .P1, .P8, .P16:
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
            case .TT, .TT12:
                self.notes.append(key.cloneNote(withHalfSteps: 6))
            case .P5, .P13:
                self.notes.append(key.cloneNote(withHalfSteps: 7))
            case .m6, .m14:
                self.notes.append(key.cloneNote(withHalfSteps: 8))
            case .M6, .M14:
                self.notes.append(key.cloneNote(withHalfSteps: 9))
            case .m7, .m15:
                self.notes.append(key.cloneNote(withHalfSteps: 10))
            case .M7, .M15:
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
    
    // true if major key of C, G, D, A, E, B, F#, C#
    // false if major key of F, Bb, Eb, Ab, Db, Gb, Cb
    func checkCircleOfFifths() -> Bool {
        var key = self.notes[0]
        
        if self.classification == .minor_harmonic || self.classification == .minor_melodic || self.classification == .minor_harmonic || self.classification == .mode_aeolian {
            key = key.augmentedSecond()
        }
        
        if key.name == "C" || key.name == "G" || key.name == "D" || key.name == "A" || key.name == "E" || key.name == "B" || key.name == "F#" || key.name == "C#" {
            return true
        } else {
            return false
        }
    }
    
    var description: String {
        let useSharps = checkCircleOfFifths()
        
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
}
