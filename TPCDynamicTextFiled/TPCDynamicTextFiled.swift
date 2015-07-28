//
//  TPCDynamicTextFiled.swift
//  TPCDynamicTextFiled
//
//  Created by tripleCC on 15/7/28.
//  Copyright (c) 2015年 tripleCC. All rights reserved.
//

import UIKit

enum TPCAnimationType:Int {
    case TPCAnimationTypeUpDown
    case TPCAnimationTypeLeftRight
    case TPCAnimationTypeBlowUp
    case TPCAnimationTypeEasyInOut
    case TPCAnimationTypeNone
}

class TPCDynamicTextFiled: UITextField {
    @IBInspectable  var normalColor: UIColor? {
        willSet {
            tpcPlaceholderLabel?.textColor = newValue
        }
    }
    @IBInspectable var selectedColor: UIColor?
    
    var animationType = TPCAnimationType.TPCAnimationTypeUpDown
    
    var operateWhenResignFirstResponder: (() -> ())?
    
    private var tpcPlaceholderLabel:UILabel? {
        get {
            return self.valueForKey("_placeholderLabel") as? UILabel
        }
    }
    
    private var tpcDisplayLabel:UILabel? {
        get {
            return self.valueForKey("_displayLabel") as? UILabel
        }
    }
    
    private func doAnimationWithType(animationType: TPCAnimationType, label: UILabel?) {
        switch animationType {
        case .TPCAnimationTypeUpDown :
            doAnimation(){
                label?.transform = CGAffineTransformMakeTranslation(0, 10)
            }
        case .TPCAnimationTypeLeftRight :
            doAnimation(){
                label?.transform = CGAffineTransformMakeTranslation(10, 0)
            }
        case .TPCAnimationTypeBlowUp :
            doAnimation(){
                label?.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }
        case .TPCAnimationTypeEasyInOut :
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                label?.alpha = 0.4
            })
        case .TPCAnimationTypeNone :
            break
        }
    }
    
    private func doAnimation(action: () -> ()) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            action()
            }, completion: nil)
    }
    
    func displayLableDoAnimationWithType(animationType: TPCAnimationType) {
        doAnimationWithType(animationType, label: self.tpcDisplayLabel)
        
        tpcDisplayLabel?.transform = CGAffineTransformIdentity
    }
    
    func placeholderLabelDoAnimationWithType(animationType: TPCAnimationType) {
        doAnimationWithType(animationType, label: self.tpcPlaceholderLabel)
    }
    
override func becomeFirstResponder() -> Bool {
    
    if normalColor == nil {
        normalColor = tpcPlaceholderLabel?.textColor
    }
    
    if selectedColor == nil {
        selectedColor = tpcPlaceholderLabel?.textColor
    }
    
    tpcPlaceholderLabel?.textColor = selectedColor

    placeholderLabelDoAnimationWithType(animationType)
    
    return super.becomeFirstResponder()
}
    
override func resignFirstResponder() -> Bool {
    
    switch animationType {
    case .TPCAnimationTypeUpDown :
        fallthrough
    case .TPCAnimationTypeBlowUp :
        fallthrough
    case .TPCAnimationTypeLeftRight :
        tpcPlaceholderLabel?.transform = CGAffineTransformIdentity
    case .TPCAnimationTypeEasyInOut :
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            tpcPlaceholderLabel?.alpha = 1.0
        })
    case .TPCAnimationTypeNone :
        break
    }
    
    if let operate = operateWhenResignFirstResponder {
        operate()
    }
    
    tpcPlaceholderLabel?.textColor = normalColor
    
    return super.resignFirstResponder()
}
}
