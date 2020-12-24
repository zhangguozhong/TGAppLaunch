//
//  TGSplashModel.swift
//  TGAppLaunch
//
//  Created by zhangguozhong on 2020/12/19.
//

import UIKit
//import YppAmumu

class TGSplashModel {

    var appkitContentId: String = ""
    
    var scheme: String = ""
    
    var imageUrl: String = ""
    
    var isVideo: Int = 0
    
    var showTime: Int = 3
    
    
    func getSplashImageUrlString() -> String {
        
        return ""
    }
    
    func getSplashVideoUrlString() -> String {
        
        return ""
    }
    
//    static func getSplashModelStorePath() -> String {
//        
//        return YppAmumuInterface().generate(withName: "SplashModel", business: .bxBase)
//    }
//    
//    static func shouldShowSplash() -> Bool {
//        return true
//    }
//    
//    static func getSplashImage() -> UIImage? {
//        
//        
//        let imageData = NSData(contentsOfFile: self.getSplashImageStoreFilePath())
//        
//        
//        if let data = imageData {
//            
//            let splashImage = UIImage(data: data as Data)
//            
//            return splashImage
//        }
//        
//        
//        return nil
//    }
//    
//    static func getSplashImageStoreFilePath() -> String {
//        
//        return YppAmumuInterface().generate(withName: "SplashImageFile", business: .bxBase)
//    }
//    
//    static func getSplashVideoStoreFilePath() -> String {
//        
//        return YppAmumuInterface().generate(withName: "SplashVideoFile.mp4", business: .bxBase)
//    }
}
