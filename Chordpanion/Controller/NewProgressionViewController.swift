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
    
    @IBOutlet weak var submitLabel: UILabel!
    
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
    
    var displayNote: String!
    var selectedNote: String!
    var selectedQuality: Quality!
    
    var showEnharmonics: Bool = false
    var showQualities: Bool = false
    var showSubmitButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayNote = ""
        selectedNote = ""
        
        configureButtonUI()
        
        setupKeyButtons()
        updateButtons(withCommand: 0)
    }
    
    
    func configureButtonUI() {
        self.oneEnharmonicLabel.layer.backgroundColor = FlatOrange().cgColor
        self.oneEnharmonicLabel.layer.cornerRadius = 10
        self.twoEnharmonicsLabel0.layer.backgroundColor = FlatGray().cgColor
        self.twoEnharmonicsLabel0.layer.cornerRadius = 10
        self.twoEnharmonicsLabel1.layer.backgroundColor = FlatGray().cgColor
        self.twoEnharmonicsLabel1.layer.cornerRadius = 10
        
        self.singleQualityLabel.layer.backgroundColor = FlatOrange().cgColor
        self.singleQualityLabel.layer.cornerRadius = 10
        self.doubleQualityLabel0.layer.backgroundColor = FlatGray().cgColor
        self.doubleQualityLabel0.layer.cornerRadius = 10
        self.doubleQualityLabel1.layer.backgroundColor = FlatGray().cgColor
        self.doubleQualityLabel1.layer.cornerRadius = 10
        
        self.submitLabel.layer.backgroundColor = FlatSkyBlue().cgColor
        self.submitLabel.layer.cornerRadius = 10
    }
    
    func updateUI() {
        if showEnharmonics {
            if let equiv = enharmonicEquivalents[displayNote] {
                self.oneEnharmonicView.isHidden = true
                self.twoEnharmonicsView.isHidden = false
                self.twoEnharmonicsLabel0.text = displayNote
                self.twoEnharmonicsLabel1.text = equiv
            } else {
                self.oneEnharmonicView.isHidden = false
                self.twoEnharmonicsView.isHidden = true
                self.oneEnharmonicLabel.text = displayNote
            }
        } else {
            self.oneEnharmonicView.isHidden = true
            self.twoEnharmonicsView.isHidden = true
        }
        
        if showQualities {
            if (keys[selectedNote]?.count)! > 1 {
                self.singleQualityView.isHidden = true
                self.doubleQualityView.isHidden = false
                self.doubleQualityLabel0.text = "Major"
                self.doubleQualityLabel1.text = "Minor"
            } else {
                self.singleQualityView.isHidden = false
                self.doubleQualityView.isHidden = true
                self.singleQualityLabel.text = keys[selectedNote]?.first?.rawValue
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
        
        self.doubleQualityLabel0.layer.backgroundColor = FlatGray().cgColor
        self.doubleQualityLabel1.layer.backgroundColor = FlatGray().cgColor
        self.twoEnharmonicsLabel0.layer.backgroundColor = FlatGray().cgColor
        self.twoEnharmonicsLabel1.layer.backgroundColor = FlatGray().cgColor
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
            showQualities = enharmonicEquivalents[displayNote] == nil ? true : false
            //showSubmitButton = keys[selectedNote]?.count == 1 ? true : false
            showSubmitButton = false
        case 2:
            // enharmonic selected
            showEnharmonics = true
            //showQualities = enharmonicEquivalents[displayNote] == nil ? true : false
            showQualities = true
            showSubmitButton = keys[selectedNote]?.count == 1 ? true : false
        case 3:
            // quality selected
            showEnharmonics = true
            showQualities = true
            showSubmitButton = true
        default:
            print("ERROR: invalid utton config command")
            fatalError("invalid button config command")
        }
        
        updateUI()
    }
    
    @objc func buttonCPressed() {
        resetColors()
        self.displayNote = "C"
        self.selectedNote = "C"
        updateButtons(withCommand: 1)
        self.pianoView.keyC.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDPressed() {
        resetColors()
        self.displayNote = "D"
        self.selectedNote = "D"
        updateButtons(withCommand: 1)
        self.pianoView.keyD.backgroundColor = FlatOrange()
    }
    
    @objc func buttonEPressed() {
        resetColors()
        self.displayNote = "E"
        self.selectedNote = "E"
        updateButtons(withCommand: 1)
        self.pianoView.keyE.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFPressed() {
        resetColors()
        self.displayNote = "F"
        self.selectedNote = "F"
        updateButtons(withCommand: 1)
        self.pianoView.keyF.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGPressed() {
        resetColors()
        self.displayNote = "G"
        self.selectedNote = "G"
        updateButtons(withCommand: 1)
        self.pianoView.keyG.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAPressed() {
        resetColors()
        self.displayNote = "A"
        self.selectedNote = "A"
        updateButtons(withCommand: 1)
        self.pianoView.keyA.backgroundColor = FlatOrange()
    }
    
    @objc func buttonBPressed() {
        resetColors()
        self.displayNote = "B"
        self.selectedNote = "B"
        updateButtons(withCommand: 1)
        self.pianoView.keyB.backgroundColor = FlatOrange()
    }
    
    @objc func buttonCsDbPressed() {
        resetColors()
        self.displayNote = "C#"
        self.selectedNote = "C#"
        updateButtons(withCommand: 1)
        self.pianoView.keyCsDb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonDsEbPressed() {
        resetColors()
        self.displayNote = "D#"
        self.selectedNote = "D#"
        updateButtons(withCommand: 1)
        self.pianoView.keyDsEb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonFsGbPressed() {
        resetColors()
        self.displayNote = "F#"
        self.selectedNote = "F#"
        updateButtons(withCommand: 1)
        self.pianoView.keyFsGb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonGsAbPressed() {
        resetColors()
        self.displayNote = "G#"
        self.selectedNote = "G#"
        updateButtons(withCommand: 1)
        self.pianoView.keyGsAb.backgroundColor = FlatOrange()
    }
    
    @objc func buttonAsBbPressed() {
        resetColors()
        self.displayNote = "A#"
        self.selectedNote = "A#"
        updateButtons(withCommand: 1)
        self.pianoView.keyAsBb.backgroundColor = FlatOrange()
    }

    @IBAction func twoEnharmonicsButton0Pressed(_ sender: UIButton) {
        selectedNote = displayNote
        self.twoEnharmonicsLabel0.layer.backgroundColor = FlatOrange().cgColor
        self.twoEnharmonicsLabel1.layer.backgroundColor = FlatGray().cgColor
        self.doubleQualityLabel0.layer.backgroundColor = FlatGray().cgColor
        self.doubleQualityLabel1.layer.backgroundColor = FlatGray().cgColor
        updateButtons(withCommand: 2)
    }
    
    @IBAction func twoEnharmonicsButton1Pressed(_ sender: UIButton) {
        selectedNote = enharmonicEquivalents[displayNote]
        self.twoEnharmonicsLabel0.layer.backgroundColor = FlatGray().cgColor
        self.twoEnharmonicsLabel1.layer.backgroundColor = FlatOrange().cgColor
        self.doubleQualityLabel0.layer.backgroundColor = FlatGray().cgColor
        self.doubleQualityLabel1.layer.backgroundColor = FlatGray().cgColor
        updateButtons(withCommand: 2)
    }
    
    @IBAction func majorButtonPressed(_ sender: UIButton) {
        selectedQuality = .major
        self.doubleQualityLabel0.layer.backgroundColor = FlatOrange().cgColor
        self.doubleQualityLabel1.layer.backgroundColor = FlatGray().cgColor
        updateButtons(withCommand: 3)
    }
    
    @IBAction func minorButtonPressed(_ sender: UIButton) {
        selectedQuality = .minor
        self.doubleQualityLabel0.layer.backgroundColor = FlatGray().cgColor
        self.doubleQualityLabel1.layer.backgroundColor = FlatOrange().cgColor
        updateButtons(withCommand: 3)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        // DEBUG: 
        print("LOG: selected \(selectedNote!) \((keys[selectedNote]?.count)! > 1 ? selectedQuality.rawValue.lowercased() : keys[selectedNote]?.first?.rawValue.lowercased() ?? "ERR")")
        performSegue(withIdentifier: "showProgressions", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showProgressions" else { return }
        
        if let destination = segue.destination as? ListViewController {
            destination.inputKey = self.selectedNote
            destination.inputClassification = (keys[selectedNote]?.count)! > 1 ? selectedQuality.rawValue : keys[selectedNote]?.first?.rawValue
        }
    }
    
    @IBAction func unwindToNewProgression(segue: UIStoryboardSegue) {
        
    }
    
    
    
    
    
}
