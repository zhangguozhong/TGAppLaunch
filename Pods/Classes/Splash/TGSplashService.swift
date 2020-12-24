//
//  TGSplashService.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/19.
//

class TGSplashService {

    
    static func updateSplashInfo() {
        
    }
    
    static func storeNewSplashVideoWithSplashModel(_ splashModel: TGSplashModel) {
        
        
        guard splashModel.getSplashVideoUrlString().count > 0 else {
            return
        }
        
        
        
    }
    
    static func storeNewSplashImageWithSplashModel(_ splashModel: TGSplashModel) {
        
        guard splashModel.getSplashImageUrlString().count > 0 else {
            return
        }
    }
}
