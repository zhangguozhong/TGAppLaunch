//
//  AppDelegate.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/18.
//

import UIKit
//import YppSoraka

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

//        YppSoraka.shared()?.launchFinish(withStepName: "Pre_Main")
//
        
        TGMainViewManager.shared.setup()
        
        DispatchQueue.main.async {
            
            TGLaunch.shared.triggerEvent(.splashEvent)
        }
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        } else {
        }
        
//        YppSoraka.shared()?.launchFinish(withStepName: "BeforeDidFinishLaunch")
        

        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
            
//        TGLogTool.actionLog(message: "程序进入后台", funcPointer: #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
//        TGLogTool.actionLog(message: "程序进入前台", funcPointer: #function)
    }
}
