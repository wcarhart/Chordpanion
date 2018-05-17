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
    
    @IBOutlet weak var oneEnharmonicView: UIView!
    @IBOutlet weak var twoEnharmonicsView: UIView!
    @IBOutlet weak var majorMinorView: UIView!
    @IBOutlet weak var submitView: UIView!
    
    @IBOutlet weak var oneEnharmonicLabel: UILabel!
    
    @IBOutlet weak var twoEnharmonicsLabel0: UILabel!
    @IBOutlet weak var twoEnharmonicsLabel1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyButtons()
        updateButtons(withCommand: 0)
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
    
    func updateButtons(withCommand command: Int, note: String = "") {
        switch command {
        case 0:
            // no note selected
            self.oneEnharmonicView.isHidden = true
            self.twoEnharmonicsView.isHidden = true
            self.majorMinorView.isHidden = true
            self.submitView.isHidden = true
        case 1:
            // note selected
            guard note != "" else { return }
            switch note {
            case "C", "D", "E", "F", "G", "A", "B":
                self.oneEnharmonicView.isHidden = false
                self.twoEnharmonicsView.isHidden = true
            case "C#", "Db", "D#", "Eb", "F#", "Gb", "G#", "Ab", "A#", "Bb":
                self.oneEnharmonicView.isHidden = true
                self.twoEnharmonicsView.isHidden = false
            default:
                print("ERROR: invalid note name")
                fatalError("invalid note name")
            }
        case 2:
            // enharmonic selected
            print("")
        case 3:
            // quality selected
            print("")
        default:
            print("ERROR: invalid utton config command")
            fatalError("invalid button config command")
        }
    }
    
    @objc func buttonCPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "C")
        self.pianoView.keyC.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "D")
        self.pianoView.keyD.backgroundColor = FlatOrange()
    }
    
    @objc func buttonEPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "E")
        self.pianoView.keyE.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "F")
        self.pianoView.keyF.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "G")
        self.pianoView.keyG.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "A")
        self.pianoView.keyA.backgroundColor = FlatOrange()
    }
    
    @objc func buttonBPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "B")
        self.pianoView.keyB.backgroundColor = FlatOrange()
    }
    
    @objc func buttonCsDbPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "C#")
        self.pianoView.keyCsDb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDsEbPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "Eb")
        self.pianoView.keyDsEb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFsGbPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "F#")
        self.pianoView.keyFsGb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGsAbPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "G#")
        self.pianoView.keyGsAb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAsBbPressed() {
        resetColors()
        updateButtons(withCommand: 1, note: "Bb")
        self.pianoView.keyAsBb.backgroundColor = FlatOrange()
    }

    @IBAction func twoEnharmonicsButton0Pressed(_ sender: UIButton) {
        
    }
    
    @IBAction func twoEnharmonicsButton1Pressed(_ sender: UIButton) {
        
    }
    
    @IBAction func majorButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func minorButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    
    
    
    
}
