//
//  TGSplash.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/21.
//

import UIKit

extension Date {
    
    func minutesBetweenDate(date: Date) -> Int {
        
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
}

extension Notification.Name {
    
    static let TG_UserLogin_Notice = Notification.Name("TG_UserLogin_Notice")
}

public class TGSplash {
    
    var splashWindow: UIWindow?
    var enterBackgroundDate: Date?

    public static let shared = TGSplash()
    
    private init() {
        
    }
    
    
    func addObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(enterBackground), name:.UIApplicationDidEnterBackground, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: .UIApplicationWillEnterForeground, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginNotice), name: .TG_UserLogin_Notice, object: nil)
    }
    
    @objc
    func enterBackground() {
        
        enterBackgroundDate = Date()
    }
    
    @objc
    func willEnterForeground() {
        
        showSplashWithEnterBackgroundDate(date: enterBackgroundDate ?? Date(), coolBoot: false)
    }
    
    @objc
    func loginNotice()  {
        
        TGSplashService.updateSplashInfo()
    }
    
    func showSplash() {
        
        showSplashWithEnterBackgroundDate(date: Date(), coolBoot: true)
    }
    
    func showSplashWithEnterBackgroundDate(date: Date, coolBoot: Bool) {
        
        if coolBoot {
            show()
            
        } else {
                        
            if let date = enterBackgroundDate, Date().minutesBetweenDate(date: date) > 59 {
                
                show()
            }
        }
    }
    
    func show() {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let splashViewController = TGSplashViewController()
        
        window.rootViewController = splashViewController
        window.isHidden = false
        window.isUserInteractionEnabled = false
        window.windowLevel = UIWindowLevelAlert + 1
        
        self.splashWindow = window
        
        self.ainimatedWithDuration()
    }
    
    func ainimatedWithDuration() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            self.hide()
        }
    }
    
    func hide() {
        
        self.splashWindow?.isHidden = true
        self.splashWindow = nil
    }
}
