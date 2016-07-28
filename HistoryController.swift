//
//  HistoryController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 23/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class HistoryController: HistoryControllerProtocol {

    var mHistoryList = NSMutableArray()
    var mHistoryListCount = 0
    var mLocalDatabaseObj = LocalDataDase()
    
    init () {
        mHistoryList = mLocalDatabaseObj.mFetchValuesFromHistoryTable()
    }
    //method to update history view 
    func updateHistoryController(list : AnyObject) {
        
    }
    
    //method to save videos in history
    func mSaveVideoDetailsInDB (videoDetails : [String : AnyObject]) {
        mLocalDatabaseObj.mInsertValueInToHistoryTable(videoDetails)
    }
}
