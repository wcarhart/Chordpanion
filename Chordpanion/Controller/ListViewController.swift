//
//  ListViewController.swift
//  Chordpanion
//
//  Created by Will Carhart on 5/16/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var inputKey: String!
    var inputClassification: String!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToNewProgression", sender: nil)
    }
    
}
