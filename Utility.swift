//
//  Utility.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 29/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import SystemConfiguration


public class Reachability {
    class func isConnectedToInternet () -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flag = SCNetworkReachabilityFlags()
        
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!,&flag) {
            return false
        }
        let isReachable = (flag.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needConnection = (flag.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needConnection)
        
        return true
    }
    
}


class Utility: NSObject {
    
    
//    func GetImageFromURL(url : String) -> <#return type#> {
//        <#function body#>
//    }
    


}
