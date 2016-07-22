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
    var mRestServiceObj : RestService!
    var mSubCategoryViewContollerProtocolObj : SubCategoryViewContollerProtocol!
    
    init(SCviewProtocolObj : SubCategoryViewContollerProtocol) {
        mSubCategoryViewContollerProtocolObj = SCviewProtocolObj
        mRestServiceObj = RestService()
        mRestServiceObj.mGetSubCategoryList(self)
    }
    
    func updateSubCategoryController (list : AnyObject) {
        mSubCatagoryList = list as! NSMutableArray
        mSubCategoryViewContollerProtocolObj.updateCollectionVIew()
    }
    
}
