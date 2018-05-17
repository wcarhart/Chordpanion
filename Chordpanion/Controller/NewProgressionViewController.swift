//
//  NewProgressionViewController.swift
//  Chordpanion
//
//  Created by Will Carhart on 5/16/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import UIKit
import ChameleonFramework

class NewProgressionViewController: UIViewController {

    @IBOutlet weak var pianoView: PianoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyButtons()
    }
    
    private func setupKeyButtons() {
        self.pianoView.buttonC.addTarget(self, action: #selector(buttonCPressed), for: .touchUpInside)
        self.pianoView.buttonD.addTarget(self, action: #selector(buttonDPressed), for: .touchUpInside)
        self.pianoView.buttonE.addTarget(self, action: #selector(buttonEPressed), for: .touchUpInside)
        self.pianoView.buttonF.addTarget(self, action: #selector(buttonFPressed), for: .touchUpInside)
        self.pianoView.buttonG.addTarget(self, action: #selector(buttonGPressed), for: .touchUpInside)
        self.pianoView.buttonA.addTarget(self, action: #selector(buttonAPressed), for: .touchUpInside)
        self.pianoView.buttonB.addTarget(self, action: #selector(buttonBPressed), for: .touchUpInside)
        self.pianoView.buttonCsDb.addTarget(self, action: #selector(buttonCsDbPressed), for: .touchUpInside)
        self.pianoView.buttonDsEb.addTarget(self, action: #selector(buttonDsEbPressed), for: .touchUpInside)
        self.pianoView.buttonFsGb.addTarget(self, action: #selector(buttonFsGbPressed), for: .touchUpInside)
        self.pianoView.buttonGsAb.addTarget(self, action: #selector(buttonGsAbPressed), for: .touchUpInside)
        self.pianoView.buttonAsBb.addTarget(self, action: #selector(buttonAsBbPressed), for: .touchUpInside)
    }
    
    private func resetColors() {
        self.pianoView.keyC.backgroundColor = FlatWhite()
        self.pianoView.keyD.backgroundColor = FlatWhite()
        self.pianoView.keyE.backgroundColor = FlatWhite()
        self.pianoView.keyF.backgroundColor = FlatWhite()
        self.pianoView.keyG.backgroundColor = FlatWhite()
        self.pianoView.keyA.backgroundColor = FlatWhite()
        self.pianoView.keyB.backgroundColor = FlatWhite()
        self.pianoView.keyCsDb.backgroundColor = FlatBlack()
        self.pianoView.keyDsEb.backgroundColor = FlatBlack()
        self.pianoView.keyFsGb.backgroundColor = FlatBlack()
        self.pianoView.keyGsAb.backgroundColor = FlatBlack()
        self.pianoView.keyAsBb.backgroundColor = FlatBlack()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func buttonCPressed() {
        resetColors()
        self.pianoView.keyC.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDPressed() {
        resetColors()
        self.pianoView.keyD.backgroundColor = FlatOrange()
    }
    
    @objc func buttonEPressed() {
        resetColors()
        self.pianoView.keyE.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFPressed() {
        resetColors()
        self.pianoView.keyF.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGPressed() {
        resetColors()
        self.pianoView.keyG.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAPressed() {
        resetColors()
        self.pianoView.keyA.backgroundColor = FlatOrange()
    }
    
    @objc func buttonBPressed() {
        resetColors()
        self.pianoView.keyB.backgroundColor = FlatOrange()
    }
    
    @objc func buttonCsDbPressed() {
        resetColors()
        self.pianoView.keyCsDb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDsEbPressed() {
        resetColors()
        self.pianoView.keyDsEb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFsGbPressed() {
        resetColors()
        self.pianoView.keyFsGb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGsAbPressed() {
        resetColors()
        self.pianoView.keyGsAb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAsBbPressed() {
        resetColors()
        self.pianoView.keyAsBb.backgroundColor = FlatOrange()
    }

}
