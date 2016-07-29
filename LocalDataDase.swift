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
    
    var dataBasePath : String! 

    override init() {
        let fileManager = NSFileManager.defaultManager()
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        dataBasePath = dirPath[0] + "/DemoAppyDB.db"
        print("Path : \(dataBasePath)")
        if(!fileManager.fileExistsAtPath(dataBasePath)) {
            print(dataBasePath)
            let AppyStoreDataBase = FMDatabase(path: dataBasePath)
            if (AppyStoreDataBase == nil) {
                print("Error : \(AppyStoreDataBase.lastErrorMessage())")
            }
            else{
                
                //CATEGOTY - (category_name,category_id,parent_category_id,parent_category_name,image_path,content_count,is_category_blocked,canonical_name,is_visible)
                //HISTORY - (group_id,parent_category_title,sub_category_title,parent_category_id,sub_category_id,content_id,sequence_type,sequence_number,title,content_duration,image_path,build_id,license_id,dnld_url,video_streaming,pay_type	)
                //open Database
                
                //for History Content_id is unique
                //for Category category_id is unique
                
                if (AppyStoreDataBase.open()) {
                    let sql_Categort = "CREATE TABLE IF NOT EXISTS CATEGORY (ID INTEGER PRIMARY KEY AUTOINCREMENT,category_name TEXT,category_id TEXT,parent_category_id TEXT,parent_category_name TEXT,image_path TEXT,content_count INTEGER,is_category_blocked INTEGER,canonical_name TEXT,is_visible INTEGER)"
                    
                    
                    let sql_History = "CREATE TABLE IF NOT EXISTS HISTORY (ID INTEGER PRIMARY KEY AUTOINCREMENT,group_id TEXT,parent_category_title TEXT,sub_category_title TEXT,parent_category_id INTEGER,sub_category_id TEXT,content_id INTEGER,sequence_type TEXT,sequence_number INTEGER,title TEXT,content_duration TEXT,image_path TEXT,build_id TEXT,license_id INTEGER,dnld_url TEXT,video_streaming TEXT,pay_type TEXT)"
                    
                    
                    //create category table table
                    if (!AppyStoreDataBase.executeStatements(sql_Categort)) {
                        print("Error create category table: \(AppyStoreDataBase.lastErrorMessage())")
                    }
                    else {
                        print("category Table created")
                    }
                    //create category table table
                    if (!AppyStoreDataBase.executeStatements(sql_History)) {
                        print("Error create history table: \(AppyStoreDataBase.lastErrorMessage())")
                    }
                    else {
                        print("history table created")
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
                print(list)
                let c_name = list["category_name"] as! String
                let c_id = list["category_id"] as! String
                let p_id = list["parent_category_id"] as! String
                let p_name = list["parent_category_name"] as! String
                let imgPath = list["image_path"]!!["50x50"] as! String
                let C_C = list["content_count"] as! Int
                let iCB = list["is_category_blocked"] as! Int
                let can_name = list["canonical_name"] as! String
                let i_vis = list["is_visible"] as! Int
            
                let insertSql = "INSERT INTO CATEGORY (category_name,category_id,parent_category_id,parent_category_name,image_path,content_count,is_category_blocked,canonical_name,is_visible) VALUES ('\(c_name)','\(c_id)','\(p_id)','\(p_name)','\(imgPath)','\(C_C)','\(iCB)','\(can_name)','\(i_vis)')"
                print(insertSql)
                if (AppyStoreDataBase.executeStatements(insertSql)) {
                    print("Data inserted")
                }
                else {
                    print("Failed to insert values into table : \(AppyStoreDataBase.lastErrorMessage())")
                }
                //close Database
//                AppyStoreDataBase.close()
            }
        }
    }
    
    //method to fetct data from category table
    func mFetchValuesFromCategoryTable() -> NSMutableArray  {
        let AppyStoreDataBase = FMDatabase(path: dataBasePath)
        let listArray = NSMutableArray()
        //open Database
        if (AppyStoreDataBase.open()) {
            let querySql = "SELECT * FROM CATEGORY"
            let result = AppyStoreDataBase.executeQuery(querySql, withArgumentsInArray: nil)
            if (result?.next() == true) {
                print("Data fetched")
                while result.next() {
                    var list = [String : AnyObject]()
                    list = [
                        "category_name" : result.stringForColumn("category_name"),
                        "category_id" : result.stringForColumn("category_id"),
                        "parent_category_id" : result.stringForColumn("parent_category_id"),
                        "parent_category_name" : result.stringForColumn("parent_category_name"),
                        "image_path" : result.stringForColumn("image_path"),
                        "content_count" : result.stringForColumn("content_count"),
                        "is_category_blocked" : result.stringForColumn("is_category_blocked"),
                        "canonical_name" : result.stringForColumn("canonical_name"),
                        "is_visible" : result.stringForColumn("is_visible"),
                    ]
                    listArray.addObject(list)
                }
            }
            else {
                print("Failed to fetch data from database")
            }
            //close Database
            AppyStoreDataBase.close()
        }
        return listArray
    }
    
    //method to insert value into history table
    func mInsertValueInToHistoryTable(video : [String : AnyObject]) {
        let AppyStoreDataBase = FMDatabase(path: dataBasePath)
        //open Database
        if (AppyStoreDataBase.open()){
            let g_id = video["group_id"] as! String
            let p_C_T = video["parent_category_title"] as! String
            let s_C_T =  video["sub_category_title"] as! String
            let p_C_id = video["parent_category_id"] as! Int
            let s_C_id = video["sub_category_id"] as! String
            let cont_id =  video["content_id"] as! Int
            let v_S_T = video["sequence_type"] as! String
            let s_No = video["sequence_number"] as! Int
            let title = video["title"] as! String
            let cont_Dur = video["content_duration"] as! String
            let img_Path = video["image_path"] as! String
            let build_ID = video["build_id"] as! String
            let lic_id = video["license_id"] as! Int
            let dnldUrl =  video["dnld_url"] as! String
            let vid_Strm =  video["video_streaming"] as! String
            let pay_Ty = video["pay_type"] as! String
            
            
            let insertSql = "INSERT INTO HISTORY            (group_id,parent_category_title,sub_category_title,parent_category_id,sub_category_id,content_id,sequence_type,sequence_number,title,content_duration,image_path,build_id,license_id,dnld_url,video_streaming,pay_type) VALUES ('\(g_id)','\(p_C_T)','\(s_C_T)','\(p_C_id)','\(s_C_id)','\(cont_id)','\(v_S_T)','\(s_No)','\(title)','\(cont_Dur)','\(img_Path)','\(build_ID)','\(lic_id)','\(dnldUrl)','\(vid_Strm)','\(pay_Ty)')"
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
        let listArray = NSMutableArray()

        //open Database
        if (AppyStoreDataBase.open()) {
            let querySql = "SELECT * FROM HISTORY"
            let result = AppyStoreDataBase.executeQuery(querySql, withArgumentsInArray: nil)
            if (result!.next() == true) {
                print("Data fetched")
                while result.next() {
                    var list = [String : AnyObject]()
                    list = [
                        "group_id" : result.stringForColumn("group_id"),
                        "parent_category_title" : result.stringForColumn("parent_category_title"),
                        "sub_category_title" : result.stringForColumn("sub_category_title"),
                        "parent_category_id" : result.stringForColumn("parent_category_id"),
                        "sub_category_id" : result.stringForColumn("sub_category_id"),
                        "content_id" : result.stringForColumn("content_id"),
                        "sequence_type" : result.stringForColumn("sequence_type"),
                        "sequence_number" : result.stringForColumn("sequence_number"),
                        "title" : result.stringForColumn("title"),
                        "content_duration" : result.stringForColumn("content_duration"),
                        "image_path" : result.stringForColumn("image_path"),
                        "build_id" : result.stringForColumn("build_id"),
                        "license_id" : result.stringForColumn("license_id"),
                        "dnld_url" : result.stringForColumn("dnld_url"),
                        "video_streaming" : result.stringForColumn("video_streaming"),
                        "pay_type" : result.stringForColumn("pay_type"),
                    ]
                    listArray.addObject(list)
                }
            }
            else {
                print("Failed to fetch data from database")
            }
            //close Database
            AppyStoreDataBase.close()
        }
        return listArray
    }
}
