//
//  SearchController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 23/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class SearchController: SearchControllerProtocol {
    
    var mSearchCategoryList = NSMutableArray()
    var mSearchCategoryListCount = 0
    var mRestServiceObj : RestService!
    var mSearchViewControllerProtocolObj : SearchViewControllerProtocol!
    
    init() {
        
    }

    func mGetSearchDetails (SviewProtocolObj : SearchViewControllerProtocol,inputText : String, offset : Int) {
        mSearchViewControllerProtocolObj = SviewProtocolObj
        mRestServiceObj = RestService()
        mRestServiceObj.mGetSearchCategoryList(self, keyWord: inputText,offSet : offset )
    }

    func updataSearchController (list : AnyObject,count : Int) {
        mSearchCategoryList.addObjectsFromArray(list as! NSMutableArray as [AnyObject])
        mSearchCategoryListCount = count
        mSearchViewControllerProtocolObj.updataSearchViewController()
    }
    
    func updataSearchController () {
        mSearchViewControllerProtocolObj.updataSearchViewController()
    }
}
