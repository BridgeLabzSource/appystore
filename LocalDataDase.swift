//
//  LocalDataDase.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 27/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import FMDB

class LocalDataDase: NSObject {
    
    var dataBasePath = String()

    override init() {
        let fileManager = NSFileManager.defaultManager()
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        dataBasePath = dirPath[0] + "tempDb.db"
        
        if(!fileManager.fileExistsAtPath(dataBasePath)) {
            let AppyStoreDataBase = FMDatabase(path: dataBasePath)
            if (AppyStoreDataBase == nil) {
                print("Error : \(AppyStoreDataBase.lastErrorMessage())")
            }
            else{
                
                //CATEGOTY - (category_name,category_id,parent_category_id,parent_category_name,image_path,content_count,is_category_blocked,canonical_name,is_visible)
                //HISTORY - (group_id,parent_category_title,sub_category_title,parent_category_id,sub_category_id,content_id,sequence_type,sequence_number,title,content_duration,image_path,build_id,license_id,dnld_url,video_streaming,pay_type	)
                //open Database
                if (AppyStoreDataBase.open()) {
                    let sql_Categort = "CREATE TABLE IF NOT EXISTS CATEGORY (ID INTEGER PRIMARY KEY AUTOINCREMENT,category_name TEXT,category_id TEXT,parent_category_id TEXT,parent_category_name TEXT,image_path TEXT,content_count INTEGER,is_category_blocked INTEGER,canonical_name TEXT,is_visible INTEGER)"
                    
                    
                    let sql_History = "CREATE TABLE IF NOT EXISTS HISTORY (ID INTEGER PRIMARY KEY AUTOINCREMENT,group_id,parent_category_title TEXT,sub_category_title TEXT,parent_category_id INTEGER,sub_category_id TEXT,content_id INTEGER,sequence_type TEXT,sequence_number INTEGER,title TEXT,content_duration TEXT,image_path TEXT,build_id TEXT,license_id INTEGER,dnld_url TEXT,video_streaming TEXT,pay_type TEXT)"
                    
                    
                    //create category table table
                    if (AppyStoreDataBase.executeQuery(sql_Categort, withArgumentsInArray: nil) == nil) {
                        print("Error : \(AppyStoreDataBase.lastErrorMessage())")
                    }
                    //create category table table
                    if (AppyStoreDataBase.executeQuery(sql_History, withArgumentsInArray: nil) == nil) {
                        print("Error : \(AppyStoreDataBase.lastErrorMessage())")
                    }
                    //close Database
                    AppyStoreDataBase.close()
                }
                //failed to open database
                else {

                }
            }
        }
    }
    //methoid to insert value into category table
    func mInsertValueInToCategoryTable(Categorylist : NSMutableArray) {
        let AppyStoreDataBase = FMDatabase(path: dataBasePath)
  
        //open Database
        if (AppyStoreDataBase.open()){
            for list in Categorylist {
                let c_name = list["category_name"]
                let c_id = list["category_id"]
                let p_id = list["parent_category_id"]
                let p_name = list["parent_category_name"]
                let imgPath = list["image_path"]
                let C_C = list["content_count"]
                let iCB = list["is_category_blocked"]
                let can_name = list["canonical_name"]
                let i_vis = list["is_visible"]
            
                let insertSql = "INSERT INTO CATEGORY (category_name,category_id,parent_category_id,parent_category_name,image_path,content_count,is_category_blocked,canonical_name,is_visible) VALUES ('\(c_name)','\(c_id)','\(p_id)','\(p_name)','\(imgPath)','\(C_C)','\(iCB)','\(can_name)','\(i_vis)')"
                if (AppyStoreDataBase.executeStatements(insertSql)) {
                    print("Data inserted")
                }
                else {
                    print("Failed to insert values into table")
                }
                //close Database
                AppyStoreDataBase.close()
            }
        }
    }
    
    //method to fetct data from category table
    func mFetchValuesFromCategoryTable() -> NSMutableArray  {
        let AppyStoreDataBase = FMDatabase(path: dataBasePath)
        let outPut = NSMutableArray()
        //open Database
        if (AppyStoreDataBase.open()) {
            let querySql = "SELECT * FROM CATEGORY"
            let result : FMResultSet? = AppyStoreDataBase.executeQuery(querySql, withArgumentsInArray: nil)
            if (result?.next() == true) {
                print("Data fetched")
            }
            else {
                print("Failed to fetch data from database")
            }
            //close Database
            AppyStoreDataBase.close()
        }
        return outPut
    }
    
    //method to insert value into history table
    func mInsertValueInToHistoryTable(video : [String : AnyObject]) {
        let AppyStoreDataBase = FMDatabase(path: dataBasePath)
        //open Database
        if (AppyStoreDataBase.open()){
            let insertSql = "INSERT INTO HISTORY (group_id,parent_category_title,sub_category_title,parent_category_id,sub_category_id,content_id,sequence_type,sequence_number,title,content_duration,image_path,build_id,license_id,dnld_url,video_streaming,pay_type) VALUES ('\(video["group_id"])','\(video["parent_category_title"])','\(video["sub_category_title"])','\(video["parent_category_id"])','\(video["sub_category_id"])','\(video["content_id"])','\(video["sequence_type"])','\(video["sequence_number"])','\(video["title"])','\(video["content_duration"])','\(video["image_path"])','\(video["build_id"])','\(video["license_id"])','\(video["dnld_url"])','\(video["video_streaming"])','\(video["pay_type"])')"
            if (AppyStoreDataBase.executeStatements(insertSql)) {
                print("Data inserted")
            }
            else {
                print("Failed to insert values into table")
            }
            //close Database
            AppyStoreDataBase.close()
        }
    }
    
    //method to fetch data from history table
    func mFetchValuesFromHistoryTable() -> NSMutableArray {
        let AppyStoreDataBase = FMDatabase(path: dataBasePath)
        let outPut = NSMutableArray()
        //open Database
        if (AppyStoreDataBase.open()) {
            let querySql = "SELECT * FROM HISTORY"
            let result : FMResultSet? = AppyStoreDataBase.executeQuery(querySql, withArgumentsInArray: nil)
            if (result!.next() == true) {
                print("Data fetched")
            }
            else {
                print("Failed to fetch data from database")
            }
            //close Database
            AppyStoreDataBase.close()
        }
        return outPut
    }
}
