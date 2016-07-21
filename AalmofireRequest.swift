//
//  AalmofireRequest.swift
//  AppyStoreProject
//
//  Created by BridgeLabz on 19/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Alamofire


class AalmofireRequest: NSObject {
    let header = ["X_APPY_IMEI" : "353368070301951",
                          
                 "X_APPY_CAMPAIGN_ID" : "8700441600",
                                            
                 "X_APPY_USERID" : "290903782",
                                                              
             "X_APPY_ANDROID_ID" : "97493b2405dcfbcf",
                                                                                
            "X_APPY_API_KEY" : "gh610rt23eqwpll"]
    
    
    func almofirerequest(controllerobject : Controllerprotocol)  {
        
        
    Alamofire.request(.GET, "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getCategoryList&content_type=videos&limit_start=0&age=1.5&incl_age=5", headers: header)
         .responseJSON { response in
            
           // print("Response String1: \(response.result.value)")
            var list = response.result.value as![String : AnyObject]
            let array =  list["Responsedetails"]!["category_id_array"]
  //          let blogs = array!["category_name"] as? [[String: AnyObject]]
            print(array)
        
            controllerobject.update(array)
            
             /*print(array)
    var myDictionary : NSMutableDictionary = NSMutableDictionary()
            
            
          for employee in array {
                let firstName = employee["category_name"]! as! String
                let lastName = employee["parent_category_name"]! as! String
                
                print("employee: \(firstName) \(lastName)")
            }*/
            
            
            }
            
        
         
            
        
           
            
    
        }
        
                
    }
  






