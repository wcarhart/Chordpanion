//
//  Staff.swift
//  Chordpanion
//
//  Created by Will Carhart on 5/17/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import UIKit

class Staff: UIView {
    
    @IBOutlet var view: UIView!
    
    // notes L
    @IBOutlet weak var B2L: UIView!
    @IBOutlet weak var A1L: UIView!
    @IBOutlet weak var G2L: UIView!
    @IBOutlet weak var E2L: UIView!
    @IBOutlet weak var C2L: UIView!
    @IBOutlet weak var D1L: UIView!
    @IBOutlet weak var F1L: UIView!
    @IBOutlet weak var F2L: UIView!
    @IBOutlet weak var D2L: UIView!
    @IBOutlet weak var E1L: UIView!
    @IBOutlet weak var G1L: UIView!
    
    // notes R
    @IBOutlet weak var B2R: UIView!
    @IBOutlet weak var A1R: UIView!
    @IBOutlet weak var G2R: UIView!
    @IBOutlet weak var E2R: UIView!
    @IBOutlet weak var C2R: UIView!
    @IBOutlet weak var D1R: UIView!
    @IBOutlet weak var F1R: UIView!
    @IBOutlet weak var F2R: UIView!
    @IBOutlet weak var D2R: UIView!
    @IBOutlet weak var E1R: UIView!
    @IBOutlet weak var G1R: UIView!
    
    // sharps L
    @IBOutlet weak var Bs2L: UIView!
    @IBOutlet weak var As2L: UIView!
    @IBOutlet weak var Gs2L: UIView!
    @IBOutlet weak var Es2L: UIView!
    @IBOutlet weak var Cs2L: UIView!
    @IBOutlet weak var Ds1L: UIView!
    @IBOutlet weak var Fs1L: UIView!
    @IBOutlet weak var Fs2L: UIView!
    @IBOutlet weak var Ds2L: UIView!
    @IBOutlet weak var Es1L: UIView!
    @IBOutlet weak var Gs1L: UIView!
    
    // sharps R
    @IBOutlet weak var Bs2R: UIView!
    @IBOutlet weak var As2R: UIView!
    @IBOutlet weak var Gs2R: UIView!
    @IBOutlet weak var Es2R: UIView!
    @IBOutlet weak var Cs2R: UIView!
    @IBOutlet weak var Ds1R: UIView!
    @IBOutlet weak var Fs1R: UIView!
    @IBOutlet weak var Fs2R: UIView!
    @IBOutlet weak var Ds2R: UIView!
    @IBOutlet weak var Es1R: UIView!
    @IBOutlet weak var Gs1R: UIView!
    
    // flats L
    @IBOutlet weak var Bb2L: UIView!
    @IBOutlet weak var Ab2L: UIView!
    @IBOutlet weak var Gb2L: UIView!
    @IBOutlet weak var Eb2L: UIView!
    @IBOutlet weak var Cb2L: UIView!
    @IBOutlet weak var Db1L: UIView!
    @IBOutlet weak var Fb1L: UIView!
    @IBOutlet weak var Fb2L: UIView!
    @IBOutlet weak var Db2L: UIView!
    @IBOutlet weak var Eb1L: UIView!
    @IBOutlet weak var Gb1L: UIView!
    
    // flats R
    @IBOutlet weak var Bb2R: UIView!
    @IBOutlet weak var Ab2R: UIView!
    @IBOutlet weak var Gb2R: UIView!
    @IBOutlet weak var Eb2R: UIView!
    @IBOutlet weak var Cb2R: UIView!
    @IBOutlet weak var Db1R: UIView!
    @IBOutlet weak var Fb1R: UIView!
    @IBOutlet weak var Fb2R: UIView!
    @IBOutlet weak var Db2R: UIView!
    @IBOutlet weak var Eb1R: UIView!
    @IBOutlet weak var Gb1R: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Staff", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
