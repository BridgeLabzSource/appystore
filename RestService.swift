//
//  RestService.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 18/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import Alamofire

class RestService: NSObject {
    
    var header = [
    "X_APPY_IMEI" : "353368070301951",
    "X_APPY_CAMPAIGN_ID" : "8700441600",
    "X_APPY_USERID" : "290903782",
    "X_APPY_ANDROID_ID" : "97493b2405dcfbcf",
    "X_APPY_API_KEY" : "gh610rt23eqwpll"
    ]
    
    func mGetSubCategoryList (controllerProtocolObj : SubCategoryControllerProtocol) {
       
        Alamofire.request(.GET, "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getContentList&content_type=videos&limit=44&offset=0&catid=175&pcatid=174&age=1.5&incl_age=5", headers: header)
            .responseJSON { response in
                var content = response.result.value as! [String : AnyObject]
                var contentList = content["Responsedetails"]!["data_array"]
                controllerProtocolObj.updateSubCategoryController(contentList!!)
        }

    }
}
