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
        
        let Cb = Note(name: "Cb")!
        print("Cb: \(Cb.value)")
        
        let Cbmaj_scaleDetect = Scale(in: Cb, ofType: .major)
        print("Cbmaj (key detected) scale: \(Cbmaj_scaleDetect)")
        
        let Cbmaj_scaleNoDetect = Scale(inKeyNamed: "Cb", ofType: .major)
        print("Cbmaj (key specified) scale: \(Cbmaj_scaleNoDetect)")
        
    }

}

