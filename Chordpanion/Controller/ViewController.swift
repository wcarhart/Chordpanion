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
        print("C: \(C.value)")
        
        let Cmaj = Scale(in: C, ofType: .major)
        print("Cmaj scale: \(Cmaj)")
        
        let Cmin = Scale(in: C, ofType: .minor_natural)
        print("Cmin scale: \(Cmin)")
        
        let C7 = Chord(inKey: Cmaj, offDegree: .I, quality: .dominantSeventh)!
        print(C7)
        
        let Cmaj7 = Chord(inKey: Cmaj, offDegree: .I, quality: .majorSeventh)!
        print(Cmaj7)
        
        let Cmin7 = Chord(inKey: Cmin, offDegree: .I, quality: .minorSeventh)!
        print(Cmin7)
        
        let Cm9 = Chord(inKey: Cmaj, offDegree: .I, quality: .minorNinth)!
        print(Cm9)
        
        let G = Note(name: "G")!
        let Gmin = Scale(in: G, ofType: .mode_aeolian)
        let Gm9 = Chord(inKey: Gmin, offDegree: .ii, quality: .minorNinth)!
        print(Gm9)
        
        let Cdim = Chord(inKey: Cmaj, offDegree: .I, quality: .diminished)!
        print(Cdim)
    }

}

