//
//  NewProgressionViewController.swift
//  Chordpanion
//
//  Created by Will Carhart on 5/16/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import UIKit
import ChameleonFramework

enum Quality: String {
    case major = "Major"
    case minor = "Minor"
}

class NewProgressionViewController: UIViewController {

    @IBOutlet weak var pianoView: PianoView!
    
    @IBOutlet weak var oneEnharmonicView: UIView!
    @IBOutlet weak var twoEnharmonicsView: UIView!
    @IBOutlet weak var singleQualityView: UIView!
    @IBOutlet weak var doubleQualityView: UIView!
    @IBOutlet weak var submitView: UIView!
    
    @IBOutlet weak var oneEnharmonicLabel: UILabel!
    @IBOutlet weak var twoEnharmonicsLabel0: UILabel!
    @IBOutlet weak var twoEnharmonicsLabel1: UILabel!
    @IBOutlet weak var singleQualityLabel: UILabel!
    @IBOutlet weak var doubleQualityLabel0: UILabel!
    @IBOutlet weak var doubleQualityLabel1: UILabel!
    
    var selectedNote: String!
    
    let keys: [String: [Quality]] = [
        "C": [.major, .minor],
        "G": [.major, .minor],
        "D": [.major, .minor],
        "A": [.major, .minor],
        "E": [.major, .minor],
        "B": [.major, .minor],
        "Cb": [.major],
        "F#": [.major, .minor],
        "Gb": [.major],
        "C#": [.major, .minor],
        "Db": [.major],
        "Ab": [.major, .minor],
        "G#": [.minor],
        "Eb": [.major, .minor],
        "D#": [.minor],
        "Bb": [.major, .minor],
        "A#": [.minor],
        "F": [.major, .minor]
    ]
    
    let enharmonicEquivalents: [String: String] = [
        "B": "Cb",
        "Cb": "B",
        "F#": "Gb",
        "Gb": "F#",
        "C#": "Db",
        "Db": "C#",
        "Ab": "G#",
        "G#": "Ab",
        "Eb": "D#",
        "D#": "Eb",
        "Bb": "A#",
        "A#": "Bb"
    ]
    
    var showEnharmonics: Bool = false
    var useOneEnharmonic: Bool = true
    var showQualities: Bool = false
    var useOneQuality: Bool = false
    var showSubmitButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedNote = ""
        
        setupKeyButtons()
        updateButtons(withCommand: 0)
    }
    
    func updateUI() {
        if showEnharmonics {
            if useOneEnharmonic {
                self.oneEnharmonicView.isHidden = false
                self.twoEnharmonicsView.isHidden = true
            } else {
                self.oneEnharmonicView.isHidden = true
                self.twoEnharmonicsView.isHidden = false
            }
        } else {
            self.oneEnharmonicView.isHidden = true
            self.twoEnharmonicsView.isHidden = true
        }
        
        if showQualities {
            if useOneQuality {
                self.singleQualityView.isHidden = false
                self.doubleQualityView.isHidden = true
            } else {
                self.singleQualityView.isHidden = true
                self.doubleQualityView.isHidden = false
            }
        } else {
            self.singleQualityView.isHidden = true
            self.doubleQualityView.isHidden = true
        }
        
        if showSubmitButton {
            self.submitView.isHidden = false
        } else {
            self.submitView.isHidden = true
        }
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
    
    func updateButtons(withCommand command: Int) {
        switch command {
        case 0:
            // no note selected
            showEnharmonics = false
            showQualities = false
            showSubmitButton = false
        case 1:
            // note selected
            showEnharmonics = true
            switch self.selectedNote {
            case "C", "G", "D", "A", "E":
                useOneEnharmonic = true
                useOneQuality = false
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
        
        updateUI()
    }
    
    @objc func buttonCPressed() {
        resetColors()
        self.selectedNote = "C"
        updateButtons(withCommand: 1)
        self.pianoView.keyC.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDPressed() {
        resetColors()
        self.selectedNote = "D"
        updateButtons(withCommand: 1)
        self.pianoView.keyD.backgroundColor = FlatOrange()
    }
    
    @objc func buttonEPressed() {
        resetColors()
        self.selectedNote = "E"
        updateButtons(withCommand: 1)
        self.pianoView.keyE.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFPressed() {
        resetColors()
        self.selectedNote = "F"
        updateButtons(withCommand: 1)
        self.pianoView.keyF.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGPressed() {
        resetColors()
        self.selectedNote = "G"
        updateButtons(withCommand: 1)
        self.pianoView.keyG.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAPressed() {
        resetColors()
        self.selectedNote = "A"
        updateButtons(withCommand: 1)
        self.pianoView.keyA.backgroundColor = FlatOrange()
    }
    
    @objc func buttonBPressed() {
        resetColors()
        self.selectedNote = "B"
        updateButtons(withCommand: 1)
        self.pianoView.keyB.backgroundColor = FlatOrange()
    }
    
    @objc func buttonCsDbPressed() {
        resetColors()
        self.selectedNote = "C#"
        updateButtons(withCommand: 1)
        self.pianoView.keyCsDb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDsEbPressed() {
        resetColors()
        self.selectedNote = "D#"
        updateButtons(withCommand: 1)
        self.pianoView.keyDsEb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFsGbPressed() {
        resetColors()
        self.selectedNote = "F#"
        updateButtons(withCommand: 1)
        self.pianoView.keyFsGb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGsAbPressed() {
        resetColors()
        self.selectedNote = "G#"
        updateButtons(withCommand: 1)
        self.pianoView.keyGsAb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAsBbPressed() {
        resetColors()
        self.selectedNote = "A#"
        updateButtons(withCommand: 1)
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
