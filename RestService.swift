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
    "X_APPY_CAMPAIGN_ID" : "8700441600",
    "X_APPY_USERID" : "290903782",
    "X_APPY_ANDROID_ID" : "97493b2405dcfbcf",
    "X_APPY_API_KEY" : "gh610rt23eqwpll"
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
                controllerProtocolObj.updateSubCategoryController(contentList!!)
        }

    }
    
    //method to get search category list
    func mGetSearchCategoryList (controllerProtocolObj : SearchViewControllerProtocol , keyWord : String) {
        Alamofire.request(.GET, "http://beta.appystore.in/appy_app/appyApi_handler.php?method=search&keyword=\(keyWord)&content_type=appsgames&limit=5&offset=0&age=1&incl_age=6", headers: header)
            .responseJSON { response in
                var content = response.result.value as! [String : AnyObject]
                let contentList = content["Responsedetails"]!["data_array"]
                controllerProtocolObj.updataSearchViewController(contentList!!)
        }
    }
    
    
}
