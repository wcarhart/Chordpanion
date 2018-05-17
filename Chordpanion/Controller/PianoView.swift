//
//  PianoView.swift
//  Chordpanion
//
//  Created by Will Carhart on 5/17/18.
//  Copyright © 2018 Will Carhart. All rights reserved.
//

import UIKit
import ChameleonFramework

class PianoView: UIView {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var keyC: UIView!
    @IBOutlet weak var keyD: UIView!
    @IBOutlet weak var keyE: UIView!
    @IBOutlet weak var keyF: UIView!
    @IBOutlet weak var keyG: UIView!
    @IBOutlet weak var keyA: UIView!
    @IBOutlet weak var keyB: UIView!
    @IBOutlet weak var keyCsDb: UIView!
    @IBOutlet weak var keyDsEb: UIView!
    @IBOutlet weak var keyFsGb: UIView!
    @IBOutlet weak var keyGsAb: UIView!
    @IBOutlet weak var keyAsBb: UIView!
    
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonCsDb: UIButton!
    @IBOutlet weak var buttonDsEb: UIButton!
    @IBOutlet weak var buttonFsGb: UIButton!
    @IBOutlet weak var buttonGsAb: UIButton!
    @IBOutlet weak var buttonAsBb: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PianoView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        updateUI()
    }
    
    private func updateUI() {
        keyC.backgroundColor = FlatWhite()
        keyC.layer.borderWidth = 1.0
        keyC.layer.cornerRadius = 10
        keyC.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyC.layer.borderColor = FlatBlack().cgColor
        
        keyD.backgroundColor = FlatWhite()
        keyD.layer.borderWidth = 1.0
        keyD.layer.cornerRadius = 10
        keyD.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyD.layer.borderColor = FlatBlack().cgColor
        
        keyE.backgroundColor = FlatWhite()
        keyE.layer.borderWidth = 1.0
        keyE.layer.cornerRadius = 10
        keyE.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyE.layer.borderColor = FlatBlack().cgColor
        
        keyF.backgroundColor = FlatWhite()
        keyF.layer.borderWidth = 1.0
        keyF.layer.cornerRadius = 10
        keyF.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyF.layer.borderColor = FlatBlack().cgColor
        
        keyG.backgroundColor = FlatWhite()
        keyG.layer.borderWidth = 1.0
        keyG.layer.cornerRadius = 10
        keyG.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyG.layer.borderColor = FlatBlack().cgColor
        
        keyA.backgroundColor = FlatWhite()
        keyA.layer.borderWidth = 1.0
        keyA.layer.cornerRadius = 10
        keyA.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyA.layer.borderColor = FlatBlack().cgColor
        
        keyB.backgroundColor = FlatWhite()
        keyB.layer.borderWidth = 1.0
        keyB.layer.cornerRadius = 10
        keyB.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyB.layer.borderColor = FlatBlack().cgColor
        
        keyCsDb.backgroundColor = FlatBlack()
        keyCsDb.layer.cornerRadius = 5
        keyCsDb.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyDsEb.backgroundColor = FlatBlack()
        keyDsEb.layer.cornerRadius = 5
        keyDsEb.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyFsGb.backgroundColor = FlatBlack()
        keyFsGb.layer.cornerRadius = 5
        keyFsGb.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyGsAb.backgroundColor = FlatBlack()
        keyGsAb.layer.cornerRadius = 5
        keyGsAb.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        keyAsBb.backgroundColor = FlatBlack()
        keyAsBb.layer.cornerRadius = 5
        keyAsBb.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat, viewBounds: CGRect) {
        
        let maskPath = UIBezierPath(roundedRect: viewBounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }

}

