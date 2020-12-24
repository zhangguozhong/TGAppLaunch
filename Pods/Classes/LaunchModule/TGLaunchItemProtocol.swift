//
//  TGLaunchItemProtocol.swift
//  TGLaunch
//
//  Created by zhangguozhong on 2020/12/21.
//

import UIKit

public protocol TGLaunchItemProtocol {
    init()
    
    static func launchLevel() -> Int
    static func launchPriority() -> Int
    
    func async() -> Bool
    
    func beforeFinishLaunch()
    func didLaunchFinish()
    func splashViewEnd()
    func mainViewAppear()
    
    func handleSplashEvent(_ context: TGContext)
    
    func applicationWillResignActive(_ context: TGContext)
    func applicationWillEnterForeground(_ context: TGContext)
    func applicationDidEnterBackground(_ context: TGContext)
    
    func applicationDidRegisterForRemoteNotifications(_ context: TGContext)

    func applicationOpenURL(_ context: TGContext)
    func applicationDidReceiveRemoteNotification(_ context: TGContext)
    func applicationDidReceiveLocalNotification(_ context: TGContext)
    
    func handleCustomerEvent(_ context: TGContext)
    
    // 打点监控配置信息
    func sceneName() -> String
    func eventName() -> String
}

public extension TGLaunchItemProtocol {
    
    static func launchPriority() -> Int {
        return 0
    }
    static func launchLevel() -> Int {
        return 0
    }
    
    func async() -> Bool {
        return false
    }
    
    func beforeFinishLaunch()  {
        
    }
    func didLaunchFinish() {
        
    }
    func splashViewEnd() {
        
    }
    func mainViewAppear() {
        
    }
    
    func applicationWillResignActive(_ context: TGContext) {
        
    }
    func applicationWillEnterForeground(_ context: TGContext) {
        
    }
    func applicationDidEnterBackground(_ context: TGContext) {
        
    }
    func applicationOpenURL(_ context: TGContext) {
        
    }
    func applicationDidReceiveRemoteNotification(_ context: TGContext) {
        
    }
    func applicationDidReceiveLocalNotification(_ context: TGContext) {
        
    }
    func applicationDidRegisterForRemoteNotifications(_ context: TGContext) {
        
    }
    
    func handleSplashEvent(_ context: TGContext) {
        
    }
    func handleCustomerEvent(_ context: TGContext) {
        
    }
}
