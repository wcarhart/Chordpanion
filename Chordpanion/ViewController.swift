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
        print("Cmaj: \(Cmaj)")
        Cmaj.repeatTonic()
        Cmaj.repeatTonic()
        print("Cmaj: \(Cmaj)")
        
        var Cmin = Scale(in: C, ofType: .minor_natural)
        print("Cmin: \(Cmin)")
        Cmin.doNotRepeatTonic()
        print("Cmin: \(Cmin)")
        
        let E = Note(name: "E")!
        var Emaj = Scale(in: E, ofType: .mode_ionian)
        print("Emaj: \(Emaj)")
        Emaj.repeatTonic()
        print("Emaj: \(Emaj)")
        Emaj.doNotRepeatTonic()
        print("Emaj: \(Emaj)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

