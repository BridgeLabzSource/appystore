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
    var mHistoryViewControllerProtocolObj : HistoryViewControllerProtocol!
    var mLocalDatabaseObj = LocalDataDase()  //create object of LocalDataDase
    
    init (histroyObj : HistoryViewControllerProtocol) {
        mHistoryViewControllerProtocolObj = histroyObj
        //mHistoryList = mLocalDatabaseObj.mFetchValuesFromHistoryTable()
        
        updateHistoryController()
    }
    
    //method to save videos in history
    func mSaveVideoDetailsInDB (videoDetails : [String : AnyObject]) {
        mLocalDatabaseObj.mInsertValueInToHistoryTable(videoDetails)
    }
    
    //method to update history view
    func updateHistoryController() {
        mHistoryList = mLocalDatabaseObj.mFetchValuesFromHistoryTable()
        mHistoryListCount = mHistoryList.count
        mHistoryViewControllerProtocolObj.updateHistoyViewController()
    }
}
