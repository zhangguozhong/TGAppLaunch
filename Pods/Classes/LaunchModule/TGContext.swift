//
//  TGContext.swift
//  TGLaunch
//
//  Created by zhangguozhong on 2020/12/21.
//

import UIKit

public class TGContext {

    public static let shared = TGContext()
    
    private init() {
        
    }
    
    public var application: UIApplication!
    
    public var openURLItem = TGOpenURLItem()

        //Notifications Remote or Local
    public var notificationsItem = TGNotificationsItem()

        //user Activity Model
    public var userActivityItem = TGUserActivityItem()
}
