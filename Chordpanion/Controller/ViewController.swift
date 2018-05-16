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
        
        let Cmaj_chord = Chord(inKey: Cmaj, offDegree: .I, quality: .halfDiminished)!
        print(Cmaj_chord)
    }

}

