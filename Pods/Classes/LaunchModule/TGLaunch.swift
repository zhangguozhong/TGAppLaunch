//
//  TGLaunch.swift
//  TGLaunch
//
//  Created by zhangguozhong on 2020/12/21.
//

import UIKit

public typealias NotificationResultHandler = (UIBackgroundFetchResult) -> Void

public struct TGNotificationsItem {
    public var notificationsError: Error?
    public var deviceToken: Data?
    public var userInfo: [AnyHashable: Any] = [:]
    public var notificationResultHander: NotificationResultHandler?
    public var localNotification: UILocalNotification?
}

public struct TGOpenURLItem {
    public var openURL: URL?
    public var sourceApplication: String = ""
    public var options: [AnyHashable: Any] = [:]
}

public typealias RestorationHandler = ([Any]?) -> Void

public struct TGUserActivityItem {
    public var userActivityType: String = ""
    public var userActivity: NSUserActivity?
    public var userActivityError: Error?
    public var restorationHandler: RestorationHandler?
}


public class TGLaunch {
    
    public static let shared = TGLaunch()
    
    private init() {
        
    }
    
    public func triggerEvent(_ eventType: TGLaunchEventType) {
        
        TGLaunchItemManager.shared.triggerEvent(eventType)
    }
}





