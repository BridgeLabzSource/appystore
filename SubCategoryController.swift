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

    
    func mGetSubCategoryDetails (SCviewProtocolObj : SubCategoryViewContollerProtocol, category : AnyObject! , offset : Int) {
        mSubCategoryViewContollerProtocolObj = SCviewProtocolObj
        mRestServiceObj = RestService()
        let cid = Int(category["category_id"] as! String)
        let pid = Int(category["parent_category_id"] as! String)
        var url = "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getContentList&content_type=videos&limit=9&offset=\(offset)&catid=\(cid!)&pcatid=\(pid!)&age=1.5&incl_age=5"

        mRestServiceObj.mGetSubCategoryList(self,url: url)
    }
    
    func updateSubCategoryController (list : AnyObject , count : Int) {
       // mSubCatagoryList = list as! NSMutableArray
        mSubCatagoryList.addObjectsFromArray(list as! NSMutableArray as [AnyObject])
        mSubCategoryListCount = count
        mSubCategoryViewContollerProtocolObj.updateCollectionVIew()
    }
    
}
