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
        // Do any additional setup after loading the view, typically from a nib.
        
        let C = Note(name: "C")!
        var Cmaj = Scale(in: C, ofType: .major)
        Cmaj.repeatTonic()
        print("Cmaj: \(Cmaj)")
        
        var Cmin = Scale(in: C, ofType: .minor_natural)
        Cmin.repeatTonic()
        print("Cmin: \(Cmin)")
        
        let E = Note(name: "E")!
        var Emaj = Scale(in: E, ofType: .mode_ionian)
        Emaj.repeatTonic()
        print("Emaj: \(Emaj)")
        
        var Emin_nat = Scale(in: E, ofType: .minor_natural)
        Emin_nat.repeatTonic()
        var Emin_har = Scale(in: E, ofType: .minor_harmonic)
        Emin_har.repeatTonic()
        print("Emin_nat: \(Emin_nat)")
        print("Emin_har: \(Emin_har)")
        
        var Emin_mel = Scale(in: E, ofType: .minor_melodic)
        Emin_mel.repeatTonic()
        print("Emin_mel: \(Emin_mel)")
        
        let Cpent1 = Scale(in: C, ofType: .pentatonic_1_major)
        print("Cpent1: \(Cpent1)")
        
        let Cpent2 = Scale(in: C, ofType: .pentatonic_2_major)
        print("Cpent2: \(Cpent2)")
        
        let Cpent1_min = Scale(in: C, ofType: .pentatonic_1_minor)
        print("Cpent1_min: \(Cpent1_min)")
        
        let Cpent2_min = Scale(in: C, ofType: .pentatonic_2_minor)
        print("Cpent2_min: \(Cpent2_min)")
        
        var Coct1 = Scale(in: C, ofType: .octatonic_1)
        Coct1.repeatTonic()
        print("Coct1: \(Coct1)")
        
        var Coct2 = Scale(in: C, ofType: .octatonic_2)
        Coct2.repeatTonic()
        print("Coct2: \(Coct2)")
        
        var Cblues = Scale(in: C, ofType: .blues)
        Cblues.repeatTonic()
        print("Cblues: \(Cblues)")
        
        var Cchrom = Scale(in: C, ofType: .chromatic)
        Cchrom.repeatTonic()
        print("Cchrom: \(Cchrom)")
        
        var Cwhole = Scale(in: C, ofType: .wholetone)
        Cwhole.repeatTonic()
        print("Cwhole: \(Cwhole)")
        
        var Cdor = Scale(in: C, ofType: .mode_dorian)
        Cdor.repeatTonic()
        print("Cdor: \(Cdor)")
        
        var Cphryg = Scale(in: C, ofType: .mode_phrygian)
        Cphryg.repeatTonic()
        print("Cphryg: \(Cphryg)")
        
        var Clyd = Scale(in: C, ofType: .mode_lydian)
        Clyd.repeatTonic()
        print("Clyd: \(Clyd)")
        
        var Cmix = Scale(in: C, ofType: .mode_mixolydian)
        Cmix.repeatTonic()
        print("Cmix: \(Cmix)")
        
        let G = Note(name: "G")!
        var Gmix = Scale(in: G, ofType: .mode_mixolydian)
        Gmix.repeatTonic()
        print("Gmix: \(Gmix)")
        
        var Cloc = Scale(in: C, ofType: .mode_locrian)
        Cloc.repeatTonic()
        print("Cloc: \(Cloc)")
    }

}

