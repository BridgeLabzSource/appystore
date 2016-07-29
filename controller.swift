//
//  controller.swift
//  AppyStoreProject
//
//  Created by BridgeLabz on 19/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class controller: Controllerprotocol {

    
    var datalist = NSMutableArray()
    var variableprotocol : ViewProtocol!
    var mRestServiceObj : RestService!
    var mLocalDatabaseObj = LocalDataDase()
    
    init(viewprotocolobject : ViewProtocol) {
        variableprotocol = viewprotocolobject

        if Reachability.isConnectedToInternet() {
            mGetCategoryDetailsFromRestService()
        }
        else {
            mGetCategoryDetailsFromLOcalDB()
        }
    }
    
    func update(list : AnyObject!){
        datalist = list as! NSMutableArray
//        mSaveCategoryDetailsInDatabase()
        variableprotocol.updateview()
    }
    
    //method to get category details from Local db
    func mGetCategoryDetailsFromLOcalDB() {
        datalist = mLocalDatabaseObj.mFetchValuesFromCategoryTable()
    }
    
    //method to get category details from Rest Services
    func mGetCategoryDetailsFromRestService() {
        mRestServiceObj = RestService()
        mRestServiceObj.mGetCategoryList(self)
    }
    
    //method to sava category details in local databast
    func mSaveCategoryDetailsInDatabase () {
        mLocalDatabaseObj.mInsertValueInToCategoryTable(datalist)
    }
    
    
    
}
