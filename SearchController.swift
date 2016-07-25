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
    
    init(SviewProtocolObj : SearchViewControllerProtocol,inputText : String) {
        mSearchViewControllerProtocolObj = SviewProtocolObj
        mRestServiceObj = RestService()
        mRestServiceObj.mGetSearchCategoryList(self, keyWord: inputText)

    }

    func updataSearchController (list : AnyObject) {
        mSearchCategoryList = list as! NSMutableArray
            mSearchViewControllerProtocolObj.updataSearchViewController()
    }
    
    func updataSearchController () {
            mSearchViewControllerProtocolObj.updataSearchViewController()
    }
}
