//
//  SubCategoryControllerProtocol.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 18/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class SubCategoryController: SubCategoryControllerProtocol {
    
    var mSubCatagoryList = NSMutableArray()
    var mSubCategoryListCount = 0
    var mRestServiceObj : RestService!
    var mSubCategoryViewContollerProtocolObj : SubCategoryViewContollerProtocol!
    var url = "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getContentList&content_type=videos&limit=5&offset=0&catid=175&pcatid=174&age=1.5&incl_age=5"
    
    init(SCviewProtocolObj : SubCategoryViewContollerProtocol, category : AnyObject!) {
        mSubCategoryViewContollerProtocolObj = SCviewProtocolObj
        mRestServiceObj = RestService()
        let cid = Int(category["category_id"] as! String)
        let pid = Int(category["parent_category_id"] as! String)
      //  var url = "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getContentList&content_type=videos&limit=5&offset=0&catid=\(cid!)&pcatid=\(pid!)&age=1.5&incl_age=5"
        var url = "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getContentList&content_type=videos&limit=5&offset=0&catid=175&pcatid=174&age=1.5&incl_age=5"
        mRestServiceObj.mGetSubCategoryList(self,url: url)
    }
    
    func updateSubCategoryController (list : AnyObject) {
        mSubCatagoryList = list as! NSMutableArray
      //  mSubCategoryListCount = list["total_count"] as! Int
        mSubCategoryViewContollerProtocolObj.updateCollectionVIew()
    }
    
}
