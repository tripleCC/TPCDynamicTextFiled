//
//  ViewController.swift
//  TPCDynamicTextFiled
//
//  Created by tripleCC on 15/7/28.
//  Copyright (c) 2015年 tripleCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFiled2: TPCDynamicTextFiled! {
        didSet {
                textFiled2.animationType = .TPCAnimationTypeLeftRight
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var textFiled3 = TPCDynamicTextFiled()
        textFiled3.normalColor = UIColor.darkGrayColor()
        textFiled3.frame = CGRect(x: 40, y: CGRectGetMaxY(textFiled2.frame) + 10, width: 200, height: 30)
        textFiled3.borderStyle = .RoundedRect
        textFiled3.placeholder = "请输入账号"
        textFiled3.font = UIFont.systemFontOfSize(14)
        textFiled3.animationType = .TPCAnimationTypeEasyInOut
        self.view.addSubview(textFiled3)
        
        var textFiled4 = TPCDynamicTextFiled()
        textFiled4.normalColor = UIColor.lightGrayColor()
        textFiled4.frame = CGRect(x: 40, y: CGRectGetMaxY(textFiled3.frame) + 10, width: 200, height: 30)
        textFiled4.borderStyle = .RoundedRect
        textFiled4.placeholder = "请输入账号"
        textFiled4.font = UIFont.systemFontOfSize(14)
        textFiled4.animationType = .TPCAnimationTypeBlowUp
        self.view.addSubview(textFiled4)
        
        var textFiled5 = TPCDynamicTextFiled()
        textFiled5.frame = CGRect(x: 40, y: CGRectGetMaxY(textFiled4.frame) + 10, width: 200, height: 30)
        textFiled5.borderStyle = .RoundedRect
        textFiled5.placeholder = "请输入账号"
        textFiled5.font = UIFont.systemFontOfSize(14)
        textFiled5.animationType = .TPCAnimationTypeNone
        textFiled5.operateWhenResignFirstResponder = { 
            textFiled5.displayLableDoAnimationWithType(.TPCAnimationTypeLeftRight)
            textFiled5.textColor = UIColor.redColor()
        }
        self.view.addSubview(textFiled5)
    }
}

