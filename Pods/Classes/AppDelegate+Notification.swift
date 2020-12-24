//
//  AppDelegate+Notification.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/19.
//

import UIKit

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // MARK: LocalNotification
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
                
        if let userInfo = notification.userInfo as NSDictionary? {
            
            handleTheRemoteNotification(userInfo: userInfo)
        }
        
        UIApplication.shared.cancelLocalNotification(notification)
    }
    
    
    // MARK: RemoteNotification
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        
//        TGLogTool.actionLog(message: "", funcPointer: #function)
        
        handleTheRemoteNotification(userInfo: userInfo as NSDictionary)
        
        completionHandler(.newData)
    }
    
    
    // MARK: UNUserNotificationCenter Delegate
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
//        TGLogTool.actionLog(message: "", funcPointer: #function)
        
        let userInfo = response.notification.request.content.userInfo as NSDictionary
        
        handleTheRemoteNotification(userInfo: userInfo)
        
        completionHandler()
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
//        TGLogTool.actionLog(message: "", funcPointer: #function)
        
        let userInfo = notification.request.content.userInfo as NSDictionary
        
        handleTheRemoteNotification(userInfo: userInfo)
        
        
        
        completionHandler(.badge)
    }
    
    func handleTheRemoteNotification(userInfo: NSDictionary) {
        
        
    }
}
