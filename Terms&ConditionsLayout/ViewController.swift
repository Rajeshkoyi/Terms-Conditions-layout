//
//  ViewController.swift
//  Terms&ConditionsLayout
//
//  Created by techno krishna on 03/08/18.
//  Copyright © 2018 techno krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       myLabel.text = "By signing up you agree to our Terms & Conditions and Privacy Policy"
        guard let text = myLabel.text else { return }
        customText(txt: text)
    }

    func customText(txt:String) {
        let underlineAttributeString = NSMutableAttributedString(string: txt)
        let attrColor = [NSForegroundColorAttributeName:#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)]
        let range1 = (txt as NSString).range(of: "Terms & Conditions")
        let range2 = (txt as NSString).range(of: "Privacy Policy")
        underlineAttributeString.addAttributes(attrColor, range: range1)
        underlineAttributeString.addAttributes(attrColor, range: range2)
        underlineAttributeString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range1)
        underlineAttributeString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range2)
        
        myLabel.attributedText = underlineAttributeString
    }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let text = (myLabel.text)!
        let termsRange = (text as NSString).range(of: "Terms & Conditions")
        let privacyRange = (text as NSString).range(of: "Privacy Policy")
        
        if gesture.didTapAttributedTextInLabel(label: myLabel, inRange: termsRange) {
            print("Tapped terms")
        } else if gesture.didTapAttributedTextInLabel(label: myLabel, inRange: privacyRange) {
            print("Tapped privacy")
        } else {
            print("Tapped none")
        }
    }
    
}

