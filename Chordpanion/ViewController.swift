//
//  ViewController.swift
//  Chordpanion
//
//  Created by Will Carhart on 4/21/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let C = Note(name: "C")!
        let Cmajor = Scale(in: C, ofType: .major)
        let I_vi_IV_V = Progression(in: Cmajor, withDegrees: [.I, .vi, .IV, .V])!
        print(I_vi_IV_V)
        
        let Bb = Note(name: "Bb")!
        let Bbmajor = Scale(in: Bb, ofType: .major)
        let TheGeneral_progression = Progression(in: Bbmajor, withDegrees: [.I, .V, .ii, .vi, .IV, .I, .V, .V])!
        print(TheGeneral_progression)
        
        
        
        /*
        let Cmaj = Chord(in: C, ofType: .major)
        let Cm = Chord(in: C, ofType: .minor)
        let C5 = Chord(in: C, ofType: .fifth)
        let C6 = Chord(in: C, ofType: .sixth)
        let Cm6 = Chord(in: C, ofType: .minorSixth)
        let C6add9 = Chord(in: C, ofType: .sixAddNine)
        let C7 = Chord(in: C, ofType: .dominantSeventh)
        let Cm7 = Chord(in: C, ofType: .minorSeventh)
        let Cmaj7 = Chord(in: C, ofType: .majorSeventh)
        let Cu = Chord(in: C, ofType: .union)
        let C9 = Chord(in: C, ofType: .dominantNinth)
        let Cm9 = Chord(in: C, ofType: .minorNinth)
        let Cmaj9 = Chord(in: C, ofType: .majorNinth)
        let C11 = Chord(in: C, ofType: .eleventh)
        let C13 = Chord(in: C, ofType: .thirteenth)
        let Cadd9 = Chord(in: C, ofType: .addNine)
        let Cadd2 = Chord(in: C, ofType: .addTwo)
        let Csus2 = Chord(in: C, ofType: .susTwo)
        let Csus4 = Chord(in: C, ofType: .susFour)
        let Csus = Chord(in: C, ofType: .sustained)
        let Csus7 = Chord(in: C, ofType: .sevenSusFour)
        let Csus9 = Chord(in: C, ofType: .nineSusFour)
        let Cdim = Chord(in: C, ofType: .diminished)
        let Cdim7 = Chord(in: C, ofType: .diminishedSeventh)
        let Cdim7b5 = Chord(in: C, ofType: .minorSeventhFlatFive)
        let Chalfdim = Chord(in: C, ofType: .halfDiminished)
        let Caug = Chord(in: C, ofType: .augmented)
        let Caug7 = Chord(in: C, ofType: .augmentedSeventh)
        let Caug7plus5 = Chord(in: C, ofType: .sevenPlusFive)
        let Caug7sharp5 = Chord(in: C, ofType: .sevenSharpFive)
        let C7minus5 = Chord(in: C, ofType: .sevenMinusFive)
        let C7b5 = Chord(in: C, ofType: .sevenFlatFive)
        let C7minus9 = Chord(in: C, ofType: .sevenMinusNine)
        let C7b9 = Chord(in: C, ofType: .sevenFlatNine)
        let C7plus9 = Chord(in: C, ofType: .sevenPlusNine)
        let C7sharp9 = Chord(in: C, ofType: .sevenSharpNine)
        
        print("\(scale.classification): \(scale)")
        
        print("\(Cmaj.name): \(Cmaj)")
        print("\(Cm.name): \(Cm)")
        print("\(C5.name): \(C5)")
        print("\(C6.name): \(C6)")
        print("\(Cm6.name): \(Cm6)")
        print("\(C6add9.name): \(C6add9)")
        print("\(C7.name): \(C7)")
        print("\(Cm7.name): \(Cm7)")
        print("\(Cmaj7.name): \(Cmaj7)")
        print("\(Cu.name): \(Cu)")
        print("\(C9.name): \(C9)")
        print("\(Cm9.name): \(Cm9)")
        print("\(Cmaj9.name): \(Cmaj9)")
        print("\(C11.name): \(C11)")
        print("\(C13.name): \(C13)")
        print("\(Cadd9.name): \(Cadd9)")
        print("\(Cadd2.name): \(Cadd2)")
        print("\(Csus2.name): \(Csus2)")
        print("\(Csus4.name): \(Csus4)")
        print("\(Csus.name): \(Csus)")
        print("\(Csus7.name): \(Csus7)")
        print("\(Csus9.name): \(Csus9)")
        print("\(Cdim.name): \(Cdim)")
        print("\(Cdim7.name): \(Cdim7)")
        print("\(Cdim7b5.name): \(Cdim7b5)")
        print("\(Chalfdim.name): \(Chalfdim)")
        print("\(Caug.name): \(Caug)")
        print("\(Caug7.name): \(Caug7)")
        print("\(Caug7plus5.name): \(Caug7plus5)")
        print("\(Caug7sharp5.name): \(Caug7sharp5)")
        print("\(C7minus5.name): \(C7minus5)")
        print("\(C7b5.name): \(C7b5)")
        print("\(C7minus9.name): \(C7minus9)")
        print("\(C7b9.name): \(C7b9)")
        print("\(C7plus9.name): \(C7plus9)")
        print("\(C7sharp9.name): \(C7sharp9)")
        */
    }

}

