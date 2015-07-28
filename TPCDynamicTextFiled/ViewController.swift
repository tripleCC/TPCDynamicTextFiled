//
//  ViewController.swift
//  TPCDynamicTextFiled
//
//  Created by tripleCC on 15/7/28.
//  Copyright (c) 2015年 tripleCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFiled2: TPCDynamicTextFiled!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFiled2.animationType = TPCAnimationType.TPCAnimationTypeLeftRight
        
        var textFiled3 = TPCDynamicTextFiled()
        textFiled3.normalColor = UIColor.darkGrayColor()
        textFiled3.frame = CGRectMake(40, CGRectGetMaxY(textFiled2.frame) + 10, 200, 30)
        textFiled3.borderStyle = UITextBorderStyle.RoundedRect
        textFiled3.placeholder = "请输入账号"
        textFiled3.font = UIFont.systemFontOfSize(14)
        textFiled3.animationType = TPCAnimationType.TPCAnimationTypeEasyInOut
        self.view.addSubview(textFiled3)
        
        var textFiled4 = TPCDynamicTextFiled()
        textFiled4.normalColor = UIColor.lightGrayColor()
        textFiled4.frame = CGRectMake(40, CGRectGetMaxY(textFiled3.frame) + 10, 200, 30)
        textFiled4.borderStyle = UITextBorderStyle.RoundedRect
        textFiled4.placeholder = "请输入账号"
        textFiled4.font = UIFont.systemFontOfSize(14)
        textFiled4.animationType = TPCAnimationType.TPCAnimationTypeBlowUp
        self.view.addSubview(textFiled4)
        
        var textFiled5 = TPCDynamicTextFiled()
        textFiled5.frame = CGRectMake(40, CGRectGetMaxY(textFiled4.frame) + 10, 200, 30)
        textFiled5.borderStyle = UITextBorderStyle.RoundedRect
        textFiled5.placeholder = "请输入账号"
        textFiled5.font = UIFont.systemFontOfSize(14)
        textFiled5.animationType = TPCAnimationType.TPCAnimationTypeNone
        textFiled5.operateWhenResignFirstResponder = { 
            textFiled5.displayLableDoAnimationWithType(TPCAnimationType.TPCAnimationTypeLeftRight)
            textFiled5.textColor = UIColor.redColor()
        }
        self.view.addSubview(textFiled5)
    }
}

