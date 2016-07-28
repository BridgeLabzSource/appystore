//
//  RestService.swift
//  AppyStoreApplication
//  Purpose
//  
//
//  Created by BridgeIt on 18/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import Alamofire

class RestService: NSObject {
    
    var header = [
    "X_APPY_IMEI" : "353368070301951",
    "X_APPY_USERID" : "290903782",
    "X_APPY_UTYPE" : "O",
    "X_APPY_UserAgent" : "Mozilla/5.0 (Linux; Android 5.0.2; Panasonic ELUGA Switch Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/51.0.2704.81 Mobile Safari/537.36",
    "X_APPY_ANDROID_ID" : "97493b2405dcfbcf",
    "X_APPY_VERSION" : "7",
    "X_APPY_API_KEY" : "gh610rt23eqwpll",
        
    "X_APPY_DEVICE_WIDTH" : "1794",
    "X_APPY_DEVICE_HEIGHT" : "1080",
    "X_APPY_CAMPAIGN_ID" : "8700441600",
    
   
    
    ]
    
    //method to get category list
    func mGetCategoryList (controllerobject : Controllerprotocol) {
        
        Alamofire.request(.GET, "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getCategoryList&content_type=videos&limit_start=0&age=1.5&incl_age=5", headers: header)
            .responseJSON { response in
                var content = response.result.value as![String : AnyObject]
                let contentList =  content["Responsedetails"]!["category_id_array"]
                controllerobject.update(contentList)  
        }
    }
    
    //method to get subcategory list
    func mGetSubCategoryList (controllerProtocolObj : SubCategoryControllerProtocol , url : String) {

        Alamofire.request(.GET, url, headers: header)
            .responseJSON { response in
                var content = response.result.value as! [String : AnyObject]
                let contentList = content["Responsedetails"]!["data_array"]
                controllerProtocolObj.updateSubCategoryController(contentList!!,count: content["Responsedetails"]!["total_count"] as! Int)
        }
    }
    
    //method to get search category list 
    func mGetSearchCategoryList (controllerProtocolObj : SearchControllerProtocol , keyWord : String, offSet : Int) {
        print(keyWord)
        var header = [
            "X_APPY_API_KEY" : "gh610rt23eqwpll"
            ]
        Alamofire.request(.GET, "http://beta.appystore.in/appy_app/appyApi_handler.php?method=search&keyword=\(keyWord)&content_type=appsgames&limit=9&offset=\(offSet)&age=1&incl_age=6", headers: header)
            .responseJSON { response in
                if response.result.value != nil {
                    var content = response.result.value as! [String : AnyObject]
                    if (content["ResponseMessage"] as! String == "Success") {
                        let contentList = content["Responsedetails"]?[0]!["data_array"]
                        controllerProtocolObj.updataSearchController(contentList!!,count: content["Responsedetails"]?[0]!["total_count"] as! Int)
                    }
                    else {
                        controllerProtocolObj.updataSearchController()
                    }
                    
                }
                else {
                    print("Failed")
                }

        }
    }
    
    
}
