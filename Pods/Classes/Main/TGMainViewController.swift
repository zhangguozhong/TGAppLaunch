//
//  TGMainViewController.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/18.
//

import UIKit

class TGMainViewController: UIViewController {

    let testLabel:UILabel = {
        
        let userLabel = UILabel()
        userLabel.text = "首页界面"
        userLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        
        userLabel.center = CGPoint(x: 200, y: 200)
        
        userLabel.textColor = UIColor.black
        return userLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.view.addSubview(testLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}
