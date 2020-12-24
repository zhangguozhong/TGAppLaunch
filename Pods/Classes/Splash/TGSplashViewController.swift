//
//  TGSplashViewController.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/19.
//

import UIKit

class TGSplashViewController: UIViewController {

    var imageView: UIImageView = {
        
        let splashImageView = UIImageView(frame: CGRect(x: 0, y: 200, width: 200, height: 70))
        
        splashImageView.backgroundColor = UIColor.gray
        
        return splashImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.view.addSubview(imageView)
    }

    deinit {
        
        print("试图被释放了")
    }
}
