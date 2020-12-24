//
//  SplashLaunchItem.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/22.
//

import UIKit

extension TGLaunchItemManager {
    
    static let SplashLaunchItemClassName = "TGAppLaunch.SplashLaunchItemDelegate"
}

class SplashLaunchItemDelegate: TGLaunchItemProtocol {
    
    required init() {
        
    }
    
    func sceneName() -> String {
        return "SplashLaunchItem"
    }
    
    func eventName() -> String {
        return "SplashLaunchItem"
    }
    
    func handleSplashEvent(_ context: TGContext) {
        
        TGSplash.shared.show()
    }
}
