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
        
        let Cmaj_scale = Scale(in: C, ofType: .major)
        print("Cmaj scale: \(Cmaj_scale)")
        
        let Cmaj_chord = Chord(inKey: Cmaj_scale, offDegree: .I)!
        print("Cmaj chord: \(Cmaj_chord)")
        
        let progression0 = Progression(inKey: Cmaj_scale, degrees: [.I, .V, .vi, .IV])!
        print("Progression: \(progression0)")
    }

}

