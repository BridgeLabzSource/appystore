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
    
    init() {
        
    }

    func updataSearchController (list : AnyObject) {
        mSearchCategoryList = list as! NSMutableArray
    }
}
