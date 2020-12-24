//
//  TGMainViewManager.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/21.
//

import UIKit

class TGMainViewManager {

    private(set) var mainWindow: UIWindow?
    
    static let shared: TGMainViewManager = TGMainViewManager()
    
    private init() {
        
    }
    
    
    func setup() {
        
        self.mainWindow = UIWindow(frame: UIScreen.main.bounds)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = self.mainWindow
        
        let tgMainViewController = TGMainViewController()
        
        self.mainWindow?.rootViewController = tgMainViewController
        self.mainWindow?.backgroundColor = UIColor.white
        self.mainWindow?.makeKeyAndVisible()
    }
}
