//
//  TGLaunchItemManager.swift
//  TGLaunch
//
//  Created by zhangguozhong on 2020/12/21.
//

import UIKit

public enum TGLaunchEventType: Int {
    
    case launchBefore = 0
    case launchFinish
    case splashEnd
    case mainViewAppear
    
    case willResignActiveEvent
    case didEnterBackgroundEvent
    case willEnterForegroundEvent
    case openURLEvent
    case didRegisterForRemoteNotificationsEvent
    case didReceiveRemoteNotificationEvent
    case didReceiveLocalNotificationEvent
    
    case splashEvent
    case didCustomEvent = 1000
}

extension TGLaunchItemManager {
    
    enum Key: String, CaseIterable {
        
        case LaunchLevelKey = "launchItemLevel"
        case LaunchPriorityKey = "launchItemPriority"
        case LaunchItemClassNameKey = "launchClassName"
    }
}

protocol TGLaunchInfoProptocol {
    
}

extension Int: TGLaunchInfoProptocol { }
extension String: TGLaunchInfoProptocol { }

typealias LaunchItemInfoDataType = Dictionary<String, TGLaunchInfoProptocol> //加载项保存信息的数据类型


@objcMembers
public class TGLaunchItemManager: NSObject {

    public static let shared = TGLaunchItemManager()
    
    var launchItemClassesInfo: [LaunchItemInfoDataType] = []
    var launchItemInstances: [TGLaunchItemProtocol] = []
    
    var launchItems: [String] = []
    
    lazy var ignorePropertyKeys = {
        
        return ["shared"]
    }()
    
    lazy var events: [Int: String] = {
        return [
            TGLaunchEventType.launchBefore.rawValue: "_didLaunchDefore",
            TGLaunchEventType.launchFinish.rawValue: "_didLaunchFinish",
            TGLaunchEventType.splashEnd.rawValue: "_didSplashViewEnd",
            TGLaunchEventType.mainViewAppear.rawValue: "_didMainViewAppear"
        ]
    }()
    
    
    private override init() {
        super.init()
        
        loadLaunchInfo(TGLaunchItemManager.self)
                
        loadAllLaunchItems()
        registerAllLaunchItems()
    }
    
    func loadLaunchInfo(_ classz: NSObject.Type) {
        var count = UInt32()
                
        guard let metalClass = object_getClass(classz),
              let properties = class_copyPropertyList(metalClass, &count) else { return }
        
        for i in 0..<Int(count) {
            let property = properties[i]
            
            guard let propertyName = NSString(utf8String: property_getName(property)) as String?,
                  !ignorePropertyKeys.contains(propertyName),
                  let propertyValue = classz.value(forKey: propertyName) as? String,
                  propertyValue.count > 0,
                  !launchItems.contains(propertyValue) else {
                
                continue
            }
            
            launchItems.append(propertyValue)
        }
        
        free(properties)
    }
    
    func loadAllLaunchItems() {
        
        guard launchItems.count > 0 else {
            return
        }
        
        var launchItemArray: [LaunchItemInfoDataType] = []
        for localLaunchClass in launchItems {
            
            if let itemClass = NSClassFromString(localLaunchClass) as? TGLaunchItemProtocol.Type {
                
                let level = itemClass.launchLevel()
                let priority = itemClass.launchPriority()
                
                var launchItemInfo: LaunchItemInfoDataType = [:]
                
                launchItemInfo[Key.LaunchLevelKey.rawValue] = level
                launchItemInfo[Key.LaunchPriorityKey.rawValue] = priority;
                launchItemInfo[Key.LaunchItemClassNameKey.rawValue] = localLaunchClass
                
                launchItemArray.append(launchItemInfo)
            }
        }
        
        launchItemClassesInfo += launchItemArray
    }
    
    func registerAllLaunchItems() {
        
        guard launchItemClassesInfo.count > 0 else {
            return
        }
        
        launchItemClassesInfo.sort { (launchLeft, launchRight) -> Bool in
            
            guard let leftLevel = launchLeft[Key.LaunchLevelKey.rawValue] as? Int,
                  let rightLevel = launchRight[Key.LaunchLevelKey.rawValue] as? Int else {
                
                return false
            }
            
            if (leftLevel != rightLevel) {
                
                return leftLevel < rightLevel
            }
            
            guard let leftPriority = launchLeft[Key.LaunchPriorityKey.rawValue] as? Int,
                  let rightPriority = launchRight[Key.LaunchPriorityKey.rawValue] as? Int else {
                
                return false
            }

            return leftPriority > rightPriority
        }
        
        for launchItem in launchItemClassesInfo {
            
            if let classStr = launchItem[Key.LaunchItemClassNameKey.rawValue] as? String,
               let launchItemClass =  NSClassFromString(classStr) as? TGLaunchItemProtocol.Type {
                
                let launchItemInstance = launchItemClass.init()
                launchItemInstances.append(launchItemInstance)
            }
        }
    }
    
    func triggerEvent(_ eventType: TGLaunchEventType) {
        
        switch eventType {
        case .launchBefore, .launchFinish, .splashEnd, .mainViewAppear:
            handleLaunchEvent(eventType)
        default:
            handleEvent(eventType)
        }
    }
    
    func handleLaunchEvent(_ eventType: TGLaunchEventType) {
        
        guard launchItemInstances.count > 0 else {
            return
        }
        
        for launchInstance in launchItemInstances {
            
            let senceName = launchInstance.sceneName()
            let eventName = launchInstance.eventName() + events[eventType.rawValue]!
                        
            let block: ()->Void = {
                
//                TGEventLog.start(senceName: senceName, eventName: eventName)

                if eventType == .launchBefore {
                    
                    launchInstance.beforeFinishLaunch()
                }
                else if eventType == .launchFinish {
                    launchInstance.didLaunchFinish()
                }
                else if eventType == .splashEnd {
                    
                    launchInstance.splashViewEnd()
                }
                else if eventType == .mainViewAppear {
                    
                    launchInstance.mainViewAppear()
                }
                
//                TGEventLog.end(senceName: senceName, eventName: eventName)
            }
        
            if launchInstance.async() {
                
                DispatchQueue.main.async {
                    block()
                }
            } else {
                
                block()
            }
        }
    }
    
    func handleEvent(_ eventType: TGLaunchEventType) {
        
        guard launchItemInstances.count > 0 else {
            return
        }
        
        for launchInstance in launchItemInstances {
            
            switch eventType {
            case .didEnterBackgroundEvent:
                launchInstance.applicationDidEnterBackground(TGContext.shared)
            case .didReceiveLocalNotificationEvent:
                launchInstance.applicationDidReceiveLocalNotification(TGContext.shared)
            case .didReceiveRemoteNotificationEvent:
                launchInstance.applicationDidReceiveRemoteNotification(TGContext.shared)
            case .didRegisterForRemoteNotificationsEvent:
                launchInstance.applicationDidRegisterForRemoteNotifications(TGContext.shared)
                
            case .willResignActiveEvent:
                launchInstance.applicationWillResignActive(TGContext.shared)
                
            case .splashEvent:
                launchInstance.handleSplashEvent(TGContext.shared)
            case .openURLEvent:
                launchInstance.applicationOpenURL(TGContext.shared)
            default:
                
                launchInstance.handleCustomerEvent(TGContext.shared)
            }
        }
    }
}
